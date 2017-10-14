class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    raise "already exists" if self[num].include?(num)
    self[num] << num
  end

  def remove(num)
    raise "doesn't exist" if !self[num].include?(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self[num].include?(num) == false
      @count += 1
      resize! if @count > @store.length
      self[num] << num
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(@store.length * 2) { Array.new }
    @store.flatten.each { |el| temp[el % temp.length] << el }
    @store = temp
  end
end
