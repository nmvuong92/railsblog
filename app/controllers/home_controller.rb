# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @message = 'static page'
  end
end
