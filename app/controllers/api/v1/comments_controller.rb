module Api
	module V1
		class CommentsController < Api::BaseController
			
			def create
				comment = Comment.new(comment_params)
				comment.user_id = signed_user.id
				comment.post_id = params[:post_id]
				if comment.save
					render json: comment.as_json(only[:post_id,:body]),status: :created
				else
					render json: {message: 'unable to create comment'}, status: 500
				end
			end

			def destroy
				comment = Comment.find(params[:id])
				if comment.destroy
					render json: {message: 'Comment Succesfully deleted'},status: 200
				else
					render json: {message: 'Unable to delete comment'}, status: 500
				end
			end

			private

				def comment_params
					params.permit(:user_id,:post_id,:body)
				end
		end
	end
end