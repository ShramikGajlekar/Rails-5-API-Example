require 'rails_helper'

RSpec.describe User do 
	describe 'validations in User Model' do
		it 'must consist of first_name, last_name, email and password' do
			user = User.new
			expect(user).to_not be_valid
			user.first_name = 'Shawn'
			user.last_name = 'Gajlekar'
			user.email = 'shramikgajlekar@gmail.com'
			user.password = 123456789
			expect(user).to be_valid
		end
	end
end