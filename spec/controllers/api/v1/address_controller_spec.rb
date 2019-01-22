require 'rails_helper'
RSpec.describe  "Api::V1::AddressesController", type: :request  do
	describe 'Addresses API' do
		before(:each) do
			FactoryBot.create_list(:address_for_requests, 19)
		end
		let!(:address) {create :address_for_requests}
		
		it 'ensures status returns ok for get /addresses' do
			get '/api/addresses'
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['data'].length).to eq(20)
		end

		it 'ensures json object returned is the one that is requested' do
			get "/api/addresses/#{address.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			
			expect(json_object['data']['addrline']).to eq(address.addrline)
			expect(json_object['data']['city']).to eq(address.city)
			expect(json_object['data']['id']).to eq(address.id)
			expect(json_object['data']['user_id']).to eq(address.user_id)
			expect(json_object['data']['country']).to eq(address.country)
			expect(json_object['data']['state']).to eq(address.state)
			expect(json_object['data']['flat_no']).to eq(address.flat_no)
			expect(json_object['data']['pin']).to eq(address.pin)
		end

		it 'ensures address can be deleted successfully' do
			delete "/api/addresses/#{address.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('Address Deleted Successfully')
		end

	end
end