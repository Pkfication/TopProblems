# ======================================================
# Jumping Numbers
# ======================================================
#

def jumpingNumbers(x)

  def isJumpingNumber?(i)
    tmp,prev = i/10,i%10
    while tmp > 0
      x = tmp % 10
      return false if (prev-x).abs != 1
      prev = x
      tmp /= 10
    end
    true
  end

  return (0..x).to_a if x < 12
  res = (0..10).to_a
  (12..x).each do |i|
    res.push(i) if isJumpingNumber?(i)
  end
  res
end


def jumpingNumbersEff(target)
  def dfs(target,current,ans)
    return if current > target
    ans.push(current)
    tmp = current % 10
    current = current * 10 + tmp
    if tmp == 0
      new_number = current + 1
      dfs(target, new_number, ans)
    elsif tmp == 9
      new_number = current - 1
      dfs(target, new_number, ans)
    else
      new_number = current + 1
      dfs(target, new_number, ans)
      new_number = current  - 1
      dfs(target, new_number, ans)
    end
  end

  ans = []
  (1..9).each do |i|
    dfs(target, i, ans)
  end
  ans
end

x = 5000
puts "Jumping numbers till #{x} are #{jumpingNumbers(x)}"
puts "Jumping numbers till #{x} are #{jumpingNumbersEff(x)}"
