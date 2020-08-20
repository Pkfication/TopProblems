# =======================================================
# Pair Sum from two array
# =======================================================
require 'set'

def pair_sum(a1, a2, k)
  return -1 if a1.length == 0 or a2.length == 0

  s,res = Set.new, []
  a2.each { |i| s.add(i) }

  a1.each do |i|
    target = k - i
    if s.include? target
      res.push([i, target])
    end
  end
  res
end

ans = pair_sum([1,2,4,5,7], [5,6,3,4,8], 9)
ans.each { |item| print item }
