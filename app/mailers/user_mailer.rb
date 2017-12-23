class UserMailer < ApplicationMailer
default from: "ramihimanshu27@gmail.com"

	def welcome_email(user)
		@user = user
		
		mail(to: @user.email, subject: 'Welcome email')
	end
end
