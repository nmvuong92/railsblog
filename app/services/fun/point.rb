module Fun
  class Point
    def initialize
      super
    end

    def bad_one(x, y)
      @x, @y = x, y
      self
    end

    def good_one(x:, y:)
      @x, @y = x, y
      self
    end

    # The Strange Ruby Splat
    def good_one2(*args)
      @x, @y = args
      self
    end

    def meth_captures(arg, &block)
      block.call(arg, 0) + block.call(arg.reverse, 1)
    end

    def say
      puts "x: #{@x} y: #{@y}"
      self
    end

    # Fun::Point.new(x: 1, y: 2).call
  end
end