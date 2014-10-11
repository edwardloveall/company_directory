class Company < ActiveRecord::Base
  validates_presence_of :name
  validates :full_address, address: true, allow_blank: true

  scope :ordered, -> { order(name: :asc) }

  def has_full_address?
    full_address.present?
  end
end
