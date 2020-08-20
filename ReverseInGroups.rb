class Node
  attr_accessor :val, :next
  def initialize(val = 0, nex = nil)
    @val = val
    @next = nex
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(val)
    node = Node.new(val)
    if @head.nil?
      @head = node
    else
      curr = @head
      while curr.next
        curr = curr.next
      end
      curr.next = node
    end
  end

  def show
    puts " "
    curr = @head
    while curr
      print curr.val, "->"
      curr = curr.next
    end
    print "nil"
  end

  def reverse
    stackRev
  end

  def batchReverse(k)
    curr = @head
    @head = nil
    tail = nil
    st = []
    while curr
      st.push(curr)
      if st.length == k or curr.next.nil?
        last_node = st[-1]
        curr = last_node.next
        while st.length > 0
          node = st.pop
          if @head.nil?
            @head = node
            tail = node
          else
            tail.next = node
            tail = node
          end
        end
      else
        curr = curr.next
      end

    end
    tail.next = nil
  end

  private

  def stackRev
    st = []
    curr = @head
    while curr
      st.push(curr)
      curr = curr.next
    end
    @head = nil
    curr = nil
    st.reverse_each do |node|
      if @head.nil?
        @head = node
        curr = node
      else
        curr.next = node
        curr = node
      end
    end
    curr.next = nil
  end
end

nodes = [1,2,2,4,5,6,7,8]
ll = LinkedList.new
nodes.each do |i|
  ll.insert(i)
end

puts
ll.show
# ll.reverse
# ll.show
ll.batchReverse(3)
ll.show
