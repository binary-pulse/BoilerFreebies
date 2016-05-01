class CommentsController < ApplicationController
	before_action :find_story
	before_action :find_comment, only: [:edit, :update, :destroy]
	# before_action :authenticate_user!


	def create
		@comment = @story.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to story_path(@story)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to story_path(@story)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to story_path(@story)
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_story
			@story = Story.find(params[:story_id])
		end

		def find_comment
			@comment = @story.comments.find(params[:id
			])
		end
end
