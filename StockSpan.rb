class StockSpan
  attr_accessor :span, :prices, :stack

  def initialize(prices)
    @span = Array.new(prices.length, 0)
    @prices = prices
    @stack = [0]
  end

  def calculateSpan
    @span[0] = 1

    (1..@prices.length - 1).each do |i|
      
      while @stack.length > 0 and @prices[@stack[-1]] <= @prices[i]
        @stack.pop
      end

      @span[i] = @stack.length <= 0 ? i + 1 : (i - @stack[-1])
      @stack.push(i)
    end
    @span
  end
end

prices = [100,80,60,70,60,75,85]
s = StockSpan.new(prices)
puts "Spans are #{s.calculateSpan}"
