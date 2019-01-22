require 'rails_helper'
RSpec.describe  "Api::V1::CommentsController", type: :request  do
	describe 'Comments API' do
		let!(:comment) {create :random_comment}
		
		it 'ensures post can be deleted successfully' do
			delete "/api/comments/#{comment.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('Comment Succesfully deleted')
		end

	end
end