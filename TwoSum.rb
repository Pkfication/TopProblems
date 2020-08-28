class TwoSum
  attr_accessor :nums, :target

  def initialize(nums = [], target = 0)
    @nums = nums
    @target = target
  end

  def hasTarget
    hash = {}
    @nums.each do |i|
      diff = @target - i
      return true if hash.has_key? diff
      hash[i] = hash.fetch(i, 0)
    end
    return false
  end
end

ts = TwoSum.new([1,4,45,6,8], 16).hasTarget
puts ts
