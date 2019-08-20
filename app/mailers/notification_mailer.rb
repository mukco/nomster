class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "devoun_edwards@yahoo.com", subject: "A Comment Has Been Added To Your Place")
  end
end