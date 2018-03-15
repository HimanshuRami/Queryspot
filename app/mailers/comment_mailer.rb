class CommentMailer < ApplicationMailer
	def comment_notification(comment, micropost, user)
		@user = user
		@comment = comment
		@micropost = micropost
		
		if comment.user != comment.micropost.user
			mail to: comment.micropost.user.email, subject: "Comment Posted"
    end
  end
end