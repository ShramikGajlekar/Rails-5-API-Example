require 'rails_helper'
RSpec.describe  "Api::V1::PostsController", type: :request  do
	describe 'Posts API' do
		before(:each) do
			FactoryBot.create_list(:random_post, 19)
		end
		let!(:post) {create :random_post}
		
		it 'ensures status returns ok for get /posts' do
			get '/api/posts'
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['data'].length).to eq(20)
		end

		it 'ensures json object returned is the one that is requested' do
			get "/api/posts/#{post.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['data']['user_id']).to eq(post.user_id)
			expect(json_object['data']['title']).to eq(post.title)
			expect(json_object['data']['desc']).to eq(post.desc)
		end

		it 'ensures post can be deleted successfully' do
			delete "/api/posts/#{post.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('Post Deleted Successfully')
		end

	end
end