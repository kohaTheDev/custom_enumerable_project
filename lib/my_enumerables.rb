# frozen_string_literal: true

# My enumerables
module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&my_block)
    return to_enum(:my_each) unless block_given?

    each do |element|
      my_block.call(element)
    end
    self
  end

  def my_all?(&my_block)
    return to_enum(:my_all?) unless block_given?

    each { |element| return false unless my_block.call(element) }
    true
  end

  def my_any?(&my_block)
    return to_enum(:my_any?) unless block_given?

    each { |element| return true if my_block.call(element) }
    false
  end

  def my_count(&my_block)
    return size unless block_given?

    count = 0
    each { |element| count += 1 if my_block.call(element) }
    count
  end

  def my_each_with_index(&my_block)
    return to_enum(:my_each_with_index) unless block_given?

    (0..size - 1).each { |index| my_block.call(self[index], index) }
    self
  end

  def my_map(&my_block)
    return to_enum(:my_map) unless block_given?

    res = []
    each { |element| res.push(my_block.call(element)) }
    res
  end

  def my_none?(&my_block)
    return to_enum(:my_none?) unless block_given?

    each { |element| return false if my_block.call(element) }
    true
  end

  def my_inject(res = 0, &my_block)
    return to_enum(:my_inject) unless block_given?

    each { |accumulator, value| res = my_block.call(accumulator, value) }
    res
  end
end
