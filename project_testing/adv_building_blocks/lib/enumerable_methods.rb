#!/usr/bin/ruby

module Enumerable

  def my_each
    for element in self
      yield(element)
    end
    self
  end

  def my_each_with_index
    i = 0
    self.my_each { |element| yield(element,i); i+=1 }
    self
  end

  def my_select
    result = []
    self.my_each { |element| result << element if block_given? && yield(element) }
    result
  end

  def my_all?
    self.my_each { |element| return false if !block_given? || !yield(element) }
    true
  end

  def my_any?
    self.my_each { |element| return true if block_given? && yield(element) }
    false
  end

  def my_none?
    self.my_each { |element| return false if block_given? && yield(element) }
    true
  end

  def my_count
    count = 0
    self.my_each { |element| count+= if block_given?
                                       yield(element)? 1:0
                                     else
                                       1
                                     end
                                      }
    count
  end

  def my_map(proc = nil)
    result = []
    if proc && block_given?
      self.my_each { |element| result << proc.call(yield(element)) }
    elsif proc && !block_given?
      self.my_each { |element| result << proc.call(element) }
    elsif proc.nil? && block_given?
      self.my_each { |element| result << yield(element) }
    else
      self
    end
    result
  end

  def my_inject(start = nil)
    start = self[0] if start.nil?
    previous_it = start
    self.my_each { |element| previous_it = yield(element,previous_it) }
    previous_it
  end

  def multiply_els(array)
    array.my_inject(1) { |element, multiply| multiply * element}
  end
end
