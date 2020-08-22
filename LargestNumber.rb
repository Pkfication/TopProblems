class LargestNumber
  attr_accessor :nums

  def initialize(nums = [])
    @nums = nums
    largest
  end

  def largest
    @nums.sort { |x,y| y+x <=> x+y }.join
  end
end

l = LargestNumber.new(%w[54 546 548 60])
puts l.largest
