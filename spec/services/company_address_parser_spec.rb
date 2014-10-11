require 'spec_helper'

describe CompanyAddressParser do
  describe '.initialize' do
    it 'assigns a company to @company' do
      company = create(:company)

      parser = CompanyAddressParser.new(company: company)

      expect(parser.company).to eq(company)
    end

    it 'raises an error if no company is passed in' do
      expect { CompanyAddressParser.new }.to raise_error(ArgumentError)
    end
  end

  describe '.perform!' do
    context 'valid address' do
      before(:each) do
        @company = create(:company, :unparsed_address)
        @parser = CompanyAddressParser.new(company: @company)
      end

      it 'parses the address into fields' do
        company = @parser.perform!

        expect(company.city).to eq('Cambridge')
        expect(company.state).to eq('MA')
        expect(company.zipcode).to eq('02142')
      end

      it 'returns a company' do
        company = @parser.perform!

        expect(company).to be_a(Company)
      end
    end

    it 'returns false when there is no address to parse' do
      parser = CompanyAddressParser.new(company: create(:company))

      company = parser.perform!

      expect(company).to be_false
    end
  end
end
