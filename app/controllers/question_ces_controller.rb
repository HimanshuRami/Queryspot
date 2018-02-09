class QuestionCesController < ApplicationController
 
 before_action :correct_user,   only: :destroy

	def create
#		binding.pry
 	@question_ce = current_user.question_ces.build(question_ce_params)
    	if @question_ce.save
      		flash[:success] = "Question created!"
      		redirect_to compdept_path
    	else
      		@post_items = []
      		render 'static_pages/compdept'
		end
	end

	def destroy
	 @question_ce.destroy
     flash[:success] = "Question deleted"
     redirect_to request.referrer || root_url
	end

	def upvote 
  	 @question_ce = QuestionCe.find(params[:id])
  	 @question_ce.upvote_by current_user
  	 redirect_back fallback_location: root_path
	end  

	def downvote
  	 @question_ce = QuestionCe.find(params[:id])
  	 @question_ce.downvote_by current_user
  	 redirect_back fallback_location: root_path
	end


	private
		def question_ce_params
			params.require(:question_ce).permit(:content, :picture, :subject_id)
		end

		def correct_user
      		@question_ce = QuestionCe.find_by(id: params[:id])
      		redirect_to root_url if @question_ce.nil?
		end

end