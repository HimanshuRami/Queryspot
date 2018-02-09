class AnswersController < ApplicationController

	def new
		@answer = Answer.new
	end
	
	def create 
		@answer = Answer.create(answer_params)
		@answer.user = current_user
		flash[:success] = "Answer Created"
		redirect_to compdept_path
	end

	def destroy
      Answer.find(params[:id]).destroy
      flash[:success] = "Answer deleted"
      redirect_to compdept_path
    end
	

	def upvote 
  	  @answer = Answer.find(params[:id])
  	  @answer.upvote_by current_user
  	  redirect_back fallback_location: root_path
	end  

	def downvote
  	  @answer = Answer.find(params[:id])
  	  @answer.downvote_by current_user
  	  redirect_back fallback_location: root_pathk
	end

	private 
	
	def answer_params
	  params.require(:answer).permit(:body, :question_ce_id, :user_id)
	end

end
