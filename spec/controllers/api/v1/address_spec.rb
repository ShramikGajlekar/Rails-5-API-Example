require 'rails_helper'
require "byebug"
RSpec.describe  "Api::V1::AddressesController", type: :request  do
	describe 'GET /addresses (index) request status' do
		it 'returns response as ok' do
			get('/api/addresses/')
			expect(response).to have_http_status(:success)
		end 
	end
end