require 'spec_helper'

class Location
  include ActiveModel::Validations
  attr_accessor :address
  validates :address, address: true
end


describe AddressValidator do
  before(:each) do
    @location = Location.new
  end

  context 'with a parseable address' do
    it 'should be valid' do
      @location.address = '222 3rd Street, Suite 400, Cambridge, MA, 02142'

      expect(@location).to be_valid
    end
  end

  context 'with incomplete address' do
    it 'should be invalid' do
      @location.address = '222 3rd Street'

      expect(@location).to be_invalid
    end
  end
end
