class FunController < ApplicationController
  def index
    Fun::Point.new.bad_one(1, 2).say
    Fun::Point.new.good_one(x: 1, y: 2).say
    Fun::Point.new.good_one2(1, 2).say
    Fun::Point.new.good_one2(x: 1, y: 2).say
    Fun::Point.new.meth_captures('pony') do |word, num|
      puts "in callback! word = #{word.inspect}, num = #{num.inspect}"
      word + num.to_s
    end
    render :plain => "ok"
  end
end
