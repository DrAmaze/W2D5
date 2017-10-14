class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    return (4345245.hash % 34205897604781379) if self.empty?
    temp = self.map.with_index { |el, i| el.hash + i }
    (temp.length + temp.reduce(:*)) % 34205897690474689
  end
end

class String
  def hash
    return (4235245.hash % 34205897604781379) if self.empty?
    alphabet = ("a".."z").to_a
    nums = (1..26).to_a
    temp = {}
    alphabet.each_with_index { |let, i| temp[let] = nums[i] }
    str2num = self.split("").map.with_index { |el,i| temp[el].hash + 435465754*i }
    str2num.reduce(:*) % 34205897690474689
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return (23049480957.hash % 34205897604781379) if self.empty?
    temp = []
    self.each { |k ,v| temp << (k.hash + v.hash) }
    temp.reduce(:*)
  end
end
