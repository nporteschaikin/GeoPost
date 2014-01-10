module Assets
  module Associations
    
    extend ActiveSupport::Concern
    
    module ClassMethods
      
      def assets symbol
        create_assets_association :has_many, symbol
      end
      
      def asset symbol
        create_assets_association :has_one, symbol
      end
      
      def create_assets_association type, symbol
        send type, symbol, as: :attached, class_name: "Assets::#{symbol.to_s.classify}"
      end
      
    end
    
  end
end