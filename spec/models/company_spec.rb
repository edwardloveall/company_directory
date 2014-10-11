require 'spec_helper'

describe Company do
  describe '.ordered' do
    it 'returns companies in alphabetical order by name' do
      beta = create(:company, name: 'Beta LLC')
      omega = create(:company, name: 'Omega Inc.')
      alpha = create(:company, name: 'Alpha Corp.')

      expect(Company.ordered).to eq([alpha, beta, omega])
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe '.has_full_address?' do
    context 'has a full address' do
      it 'returns true' do
        company = create(:company, :addressed)

        expect(company).to have_full_address
      end
    end
  end
end
