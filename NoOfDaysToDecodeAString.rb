# ======================================================
# Number of ways to decode a string
# ======================================================
#
def decode_helper(d, n)
  return 1 if n == 1 or n == 0

  count = 0
  count = decode_helper(d, n-1) if d[n-1] > '0'
  if d[n-2] == '2' or d[n-2] == '1' and d[n-1] < '7'
    count += decode_helper(d, n-2)
  end
  return count
end

def decode(digits)
  decode_helper(digits, digits.length)
end

digits = "1234"
puts "===="
puts
puts "Number of ways to decode #{digits} are #{decode(digits)}"
