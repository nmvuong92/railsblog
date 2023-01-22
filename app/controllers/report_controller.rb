class ReportController < ApplicationController
  before_action :set_variable, only: [:index, :generate]
  def index

  end

  def generate
    flash[:message] = "success"
    redirect_to "report"
  end

  private
  def set_variable
    @foo = "Foo value from controller"
  end
end
