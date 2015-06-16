def merge_sort(array)
  return array if array.length <= 1
  half = array.length / 2
  merge_arrays(merge_sort(array[0..half-1]),merge_sort(array[half..-1]))
end

def merge_arrays(left, right)
  result = []
  until left.empty? or right.empty?
	left.first <= right.first ? result << left.shift : result << right.shift
  end
  result + left + right
end

p merge_sort([9,5,0,0,1,-3,11,13,29,1000,24,15])
