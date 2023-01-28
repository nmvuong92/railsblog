class TweetController < ApplicationController
  def create
    TweetCreator.call(params[:message])
  end

  def follow
    TweetFollow.call(params[:message])
    render :plain => "OK: #{params[:message]}"
  end
end
