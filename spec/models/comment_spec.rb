require 'rails_helper'

RSpec.describe Comment do
  describe 'validations in Comment model' do
  	let!(:comment) {build(:random_comment)}

  	it 'ensures presence of body' do
  		comment.body = nil
  		expect(comment).to_not be_valid
  	end

  	it 'ensures if all the fields are correct then comment is valid' do
  		expect(comment).to be_valid
  	end

  end
end
