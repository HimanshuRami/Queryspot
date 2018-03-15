class AnswerMailer < ApplicationMailer

	def answer_notification(answer, question_ce, user)
		@user = user
		@answer = answer
		@question_ce = question_ce
		
		if answer.user != answer.question_ce.user
		 mail to: answer.question_ce.user.email, subject: "Answer Posted"
	    end
	end 
end
