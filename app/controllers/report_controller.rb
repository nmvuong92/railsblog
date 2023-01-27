# frozen_string_literal: true

class ReportController < ApplicationController
  before_action :set_variable, only: %i[index generate]
  def index; end

  def generate
    flash[:message] = 'success'

    CreateReportJob.perform_later

    @user = User.first
    UserMailer.with(user: @user).welcome_email.deliver_later
    redirect_to '/report'
  end

  private

  def set_variable
    @foo = 'Foo value from controller'
  end
end
