class Company < ActiveRecord::Base
  def has_full_address?
    full_address.present?
  end
end
