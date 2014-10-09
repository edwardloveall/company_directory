require 'spec_helper'

describe Company do
  describe '.has_full_address?' do
    context 'has a full address' do
      it 'returns true' do
        company = create(:company, :addressed)

        expect(company).to have_full_address
      end
    end
  end
end
