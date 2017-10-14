class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def each(&block)

  end
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    iter = Node.new
    iter.next = first
    while iter.next != nil
      curr = iter.next
      return curr.val if curr.key == key
      iter.next = curr.next
    end
    return nil
  end

  def include?(key)
    !get(key).nil?
  end

  def append(key, val)
    n = Node.new(key, val)
    n.next = @tail
    n.prev = @tail.prev

    @tail.prev.next = n
    @tail.prev = n
  end

  def update(key, val)
    iter = Node.new
    iter.next = first
    until iter.next.val.nil?
      curr = iter.next
      if curr.key == key
        curr.val = val
        break
      end
      iter.next = curr.next
    end
    nil
  end

  def remove(key)
    iter = Node.new
    iter.next = first
    until iter.next.val.nil?
      curr = iter.next
      if curr.key == key
        curr.remove
        break
      end
      iter.next = curr.next
    end
    nil
  end

  def each
    current_node = @head.next
    until current_node.next == nil
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
