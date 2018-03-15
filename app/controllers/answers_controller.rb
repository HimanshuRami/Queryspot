class AnswersController < ApplicationController

	def new
		@answer = Answer.new
	end
	
	def create 
		@answer = Answer.create(answer_params)
		if @answer.save
			AnswerMailer.answer_notification(@answer, @question_ce, @user).deliver_now
		@answer.user = current_user
		flash[:success] = @answer.user.name + "Thanks For Answering...!!!"
		redirect_to compdept_path
		else flash[:danger] = "Error in Creating Answer.!"
			redirect_to compdept_path
		end
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
  	  redirect_back fallback_location: root_path
	end

	private 
	
	def answer_params
	  params.require(:answer).permit(:body, :question_ce_id, :user_id, :picture)
	end
end
