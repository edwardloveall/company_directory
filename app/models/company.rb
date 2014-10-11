class Company < ActiveRecord::Base
  validates_presence_of :name

  scope :ordered, -> { order(name: :asc) }

  def has_full_address?
    full_address.present?
  end
end
