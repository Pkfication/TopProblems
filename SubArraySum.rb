# Sub Array with given sum
# O(n^2)
# O(1)
def subArray(arr, sum)
  return -1 if arr.length == 0
  s = arr.length
  current_sum = 0
  (0..s-2).each do |i|
    current_sum = arr[i]
    j = i+1
    while j < s do
      current_sum += arr[j]
      return [i+1,j+1] if current_sum == sum
      break if current_sum < sum
      j+=1
    end
  end

  return -1
end

def subArrayEff(arr, sum)
  return -1 if arr.length == 0
  curr_s = arr[0]
  start = 0
  i,s = 1, arr.length

  while i <= s do
    while curr_s > sum && start < i-1
      curr_s -= arr[start]
      start += 1
    end
    return [start+1, i] if curr_s == sum
    curr_s += arr[i] if i < s
    i += 1
  end

  return -1
end
res = subArray([15, 2, 4, 8, 9, 5, 10, 23], 12)
res1 = subArrayEff([15, 2, 4, 8, 9, 5, 10, 23], 12)
puts 'res 1', res, 'res2', res1
