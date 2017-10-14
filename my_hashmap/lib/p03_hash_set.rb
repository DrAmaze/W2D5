require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if self[num].include?(num) == false
      @count += 1
      resize! if @count > @store.length
      self[num] << num
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(num)
  end

  def remove(key)
    num = key.hash
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
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
