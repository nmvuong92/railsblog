# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notification@example.com'
  layout 'mailer'
  def mailer(user)
    @user = user
    @url = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'welcome to my awesome site!')
  end
end
