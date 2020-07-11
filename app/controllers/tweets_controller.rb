class TweetsController < ApplicationController
	before_action :authenticate_user!

	def index
		json_response(current_user.tweets, :ok)
	end

	def create
		byebug
		begin
			@tweet = Tweet.create!(tweet_params)
			json_response(@tweet, :ok)
		rescue
			json_response(:unprocessable_entity)
		end	
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content, :user_id)
	end
end
