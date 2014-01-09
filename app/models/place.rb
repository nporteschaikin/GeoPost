class Place < ActiveRecord::Base
  
  COORDINATES_REGEXP = /^(\-?\d+(\.\d+)?),\s*(\-?\d+(\.\d+)?)$/
  
  attr_accessible   :query
  serialize         :types, Array
  
  before_validation :geocode, if: ->(place) { place.query.present? and place.query_changed? }
  
  validates             :query, uniqueness: { case_sensitive: false }
  validates_presence_of :query
  
  def geocode
    result    = Geocoder.search(query).first
    if result
      self.latitude   = result.latitude
      self.longitude  = result.longitude
      self.address    = result.address
      self.types      = result.types
    else
      errors.add :base, "No places match the query '#{query}'"
    end
  end
  
  def method_missing method, *args, &block
    case method
    when /^([a-z]*[?])$/
      types.include? method[/[a-z]{1,}/]
    else
      super
    end
  end
  
  class << self
    
    def find_or_initialize query
      if coordinates? query
        find_or_initialize_by_latitude_and_longitude *query_to_coordinates(query)
      else
        find_or_initialize_by_query query
      end
    end
    
    def find_or_create query
      if coordinates? query
        find_or_create_by_latitude_and_longitude *query_to_coordinates(query)
      else
        find_or_create_by_query query
      end
    end
    
    def coordinates? query
      query =~ COORDINATES_REGEXP or (query.is_a?(Array) and query.size == 2)
    end
    
    def query_to_coordinates query
      query = query.split(COORDINATES_REGEXP).reject{|coord| coord.empty?} if query.is_a?(String)
      query
    end
    
  end
  
end
