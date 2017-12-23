class UserMailer < ApplicationMailer
default from: "example@railstutorial.com"

	def welcome_email(user)
		@user = user
		
		mail(to: @user.email, subject: 'test welcome email')
	end
end
