class Stack
  attr_accessor :stack, :min_ele
  def initialize
    @stack = []
    @min_ele = 0
  end

  def push(ele)
    if @stack.empty?
      @stack.push(ele)
      @min_ele = ele
    elsif ele < @min_ele
      @stack.push(2*ele - @min_ele)
      @min_ele = ele
    else
      @stack.push(ele)
    end
  end

  def pop
    return "Stack is Empty" if @stack.empty?
    if peek < @min_ele
      val = @min_ele
      @min_ele = (2 * @min_ele) - peek
      @stack.pop
      val
    else
      @stack.pop
    end
  end

  def isEmpty
    return @stack.empty?
  end

  def peek
    @stack[-1]
  end

  def min
    @min_ele
  end

  def log
    puts "==Stack=="
    @stack.each { |i| puts i }
  end
end


s = Stack.new
# (1..10).each do |i|
#   s.push(i * (rand(100) + 1))
# end
s.push(5)
puts "#{s.min} is the smallest number"
s.push(3)
puts "#{s.min} is the smallest number"
s.push(7)
puts "#{s.min} is the smallest number"
s.push(1)
puts "#{s.min} is the smallest number"
s.push(10)
puts "#{s.min} is the smallest number"
s.push(11)
puts "#{s.min} is the smallest number"
s.push(4)
puts "#{s.min} is the smallest number"
s.pop
s.pop
s.pop
s.pop
puts "#{s.min} is the smallest number"
s.log
puts "#{s.min} is the smallest number"
