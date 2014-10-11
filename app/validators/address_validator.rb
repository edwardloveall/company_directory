class AddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless StreetAddress::US.parse(value)
      record.errors[attribute] << (options[:message] || 'not a valid address')
    end
  end
end
