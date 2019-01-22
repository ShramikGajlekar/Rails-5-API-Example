require 'rails_helper'

RSpec.describe Address do 
	describe 'validations in address Model' do
		let!(:address) {build(:random_address)}
		
		it 'ensures presence of user_id' do
			address.user_id = nil
			expect(address).to_not be_valid
		end
		
		it 'ensures	presence of pin' do
			address.pin = nil
			expect(address).to_not be_valid
		end			

		it 'ensure country present is the one that is actually allowed' do
			unless ['India', 'US', 'UK', 'Nepal', 'Bhutan', 'Bangladesh'].include? address.country
				expect(address).to_not be_valid
			else
				expect(address).to be_valid
			end
		end

		it 'ensures if all the fields are correct then address is valid' do
			address.country = 'India'
			expect(address).to be_valid
		end
	end
end