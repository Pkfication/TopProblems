# ======================================================
# Maximum Index
# ======================================================
#
def maxIndex(arr)
  return 0 if arr.length <= 1

  max_diff, s = 0, arr.length
  (0..s-2).each do |i|
    j = i+1
    while j < s
      max_diff = j - i if arr[i] <= arr[j] and j - i > max_diff
      j+=1
    end
  end
  max_diff
end

def maxIndexEff(arr)
  return 0 if arr.length <= 1

  n = arr.length
  lMin = Array.new(n,0)
  rMax = Array.new(n,0)

  lMin[0] = arr[0]
  (1..n-1).each { |x| lMin[x] = [arr[x], lMin[x-1] ].min }

  rMax[n-1] = arr[n-1]
  (0..n-2).reverse_each { |x| rMax[x] = [arr[x], rMax[x+1]].max }

  max_diff = -1
  i,j = 0,0
  while i < n and j < n
    if lMin[i] <= rMax[j]
      max_diff = [max_diff, j-i].max
      j += 1
    else
      i += 1
    end
  end

  max_diff
end
arr = [10,20,32,1,45,2]
puts "Max Index in #{arr} is #{maxIndex(arr)}"
puts "Max Index in #{arr} is #{maxIndexEff(arr)}"
