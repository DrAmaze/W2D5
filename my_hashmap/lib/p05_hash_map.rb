require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def each(&block)
    @store.each do |list|
      block.call(list)
    end
  end

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key.hash).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key.hash).update(key, val)
    else
      bucket(key.hash).append(key, val)
    end
  end

  def get(key)
    # return nil unless self.include?(key)
    list = bucket(key.hash)
    list.get(key)
  end

  def delete(key)
    bucket(key.hash).remove(key)
  end

  # def each
  #   @store.each do |list|
  #     yield list
  #   end
  # end

  def count
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key % num_buckets]
  end
end
