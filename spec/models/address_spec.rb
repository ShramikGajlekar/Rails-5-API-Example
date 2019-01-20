require 'rails_helper'

RSpec.describe Address do 
	describe 'validations in address Model' do
		it 'must consist of pin,country,user_id' do
			user = User.create(first_name: 'Shawn',last_name: 'Gajlekar', email: 'shramikgajlekar5@gmail.com',password: 12345678 )
			address = Address.new
			expect(address).to_not be_valid
			address.pin = 4450011
			address.country = 'India'
			expect(address).to_not be_valid
			address.pin = 445001
			expect(address).to_not be_valid
			address.user_id = user.id
			expect(address).to be_valid
		end
	end
end