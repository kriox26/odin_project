#!/usr/bin/ruby

module Enumerable

  def my_each
    for element in self
      yield(element)
    end
  end

  def my_each_with_index
    i = 0
    self.my_each { |element| yield(element,i); i+=1 }
  end

  def my_select
    self.my_each { |element| result << element if yield(element) }
    result
  end

  def my_all?
    self.my_each { |element| return false unless yield(element) }
  end

  def my_any?
    self.my_each { |element| return true if yield(element) }
  end

  def my_none?
    self.my_each { |element| return false if yield(element) }
  end

  def my_count
    count = 0
    self.my_each { |element| count+=1 if yield(element) }
    count
  end

  def my_map(proc = nil)
    result[]
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
    array.my_inyect(1) { |element, multiply| multiply * element}
  end
end

