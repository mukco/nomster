class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    @user = User.params[:user_id]
    mail(to: "no_reply@nomsterapp.com", subject: "A Comment Has Been Added To Your Place")
  end
end