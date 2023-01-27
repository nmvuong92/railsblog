# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notification@example.com'
  layout 'mailer'
  def welcome_email
    @user = params[:user]
    @url = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'zwelcome to my awesome site!')
  end
end
