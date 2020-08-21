class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def push(ele)
    @stack.push(ele)
  end

  def pop
    raise StandardError if @stack.empty?
    @stack.pop
  end

  def isEmpty
    return @stack.empty?
  end

  def log
    puts "==Stack=="
    @stack.each { |i| puts i }
  end
end

class MinStack < Stack

  attr_accessor :min_stack
  def initialize
    super
    @min_stack = []
  end

  def push(ele)
    @min_stack.push(ele) if @min_stack.empty? or @min_stack[-1] > ele
    super
  end

  def pop
    val = super
    if val == min
      @min_stack.pop
    end
    val
  end

  def min
    raise NotImplementedError if @min_stack.empty?
    return @min_stack[-1]
  end

end

# s = Stack.new
# s.push(10)
# s.push(12)
# s.push(14)
# s.log
# s.pop
# s.isEmpty
# s.log

s = MinStack.new
(1..100).each do |i|
s.push(i * (rand(100) + 1))
end
puts "Stack in #{s.isEmpty ? '' : 'Not'} Empty"
s.log
puts "#{s.min} is the smalles number"
100.times do
  puts s.pop
end
s.push(23)
puts "#{s.min} is the smallest number"
