class CompanyAddressParser
  attr_accessor :company

  def initialize(company:)
    @company = company
  end

  def self.perform!(company:)
    new(company: company).perform!
  end

  def perform!
    address = StreetAddress::US.parse(@company.full_address)
    if address
      company.tap do |c|
        c.update(
          city: address.city,
          state: address.state,
          zipcode: address.postal_code
        )
      end
    end
  end
end
