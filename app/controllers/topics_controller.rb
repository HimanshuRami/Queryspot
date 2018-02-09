class TopicsController < ApplicationController

before_action :logged_in_user,only: [:index ]

	def new
		@topic = Topic.new
	end

	def index
		@topics = Topic.all
	end

	def create
	binding.pry	
	end

	def show
		@topic = Topic.find(params[:id])
	end

	private

	def logged_in_user
	      unless logged_in?
	        flash[:danger] = "Please log in."
	        redirect_to login_url
	      end
    end
end


