# ======================================================
# Finding the numbers
# ======================================================
# O(n) Time Complexity
# O(n) Auxillary Space

def findNumbers(arr)
  h = {}
  arr.each do |n|
    if h.has_key? n
      h.delete(n)
    else
      h[n] = 1
    end
  end
  h.keys
end

arr = [1,2,3,2,1,4,3,4,7,7,99,99,88,88,77,77,66,66,55,55,33,22]
puts "Two non repeating characters are #{findNumbers(arr)}"
