class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /[a-z][-a-z0-9]*/
      record.errors[attribute] << (options[:message] || "is not a valid slug")
    end
  end
end