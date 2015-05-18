# Implement Bubble sort for advanced building blocks project of the Ruby course
# Matias Pan - https://github.com/kriox26/odin_project/ruby_building_blocks/bubble_sort.rb

# Instead of doing a swap with a tmp variable, i wrote this method that does that for you
def swap(value1, value2)
  return value2, value1         
end

def bubble_sort(array_to_sort)
  last_swap = 1 # We set it to 1 only to force it to do at least one iteration
  while last_swap > 0
    new_swap = 0
    (array_to_sort.length()-1).times do |i|
      if array_to_sort[i] > array_to_sort[i+1]
        array_to_sort[i+1], array_to_sort[i] = swap(array_to_sort[i+1], array_to_sort[i])
        new_swap = i + 1 # Update the swap we just did
      end
    end
    last_swap = new_swap        # Update last_swap to the swap latest swap of the for
  end
  array_to_sort                 # Return the sorted array
end

array = [4,3,78,2,0,2]
sorted_array = bubble_sort(array)
p sorted_array
