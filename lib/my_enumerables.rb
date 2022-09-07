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

    all? { |element| my_block.call(element) }
  end
end
