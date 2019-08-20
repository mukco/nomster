require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  default from: "no-reply@nomsterapp.com"
  layout 'mailer'
end
