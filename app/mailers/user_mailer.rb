class UserMailer < ApplicationMailer

# default from: "ramihimanshu27@gmail.com"

  def account_activation(user)
    @user = user
    
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  #def welcome_email(user)
   # @user = user
    
    #mail to: user.email, subject: "Welcome email"
  #end
end


#  def account_activation(user)
 # 	@user = user
  #	mail to: user.email, subject: "Account activation"
    
  #end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  #def password_reset
   # @greeting = "Hi"

  #  mail to: "to@example.org"
 # end
#end
