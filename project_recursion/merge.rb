def merge_sort(array)
  return array if array.length == 1
  half = array.length / 2
  merge_arrays(merge_sort(array[0..half-1]),merge_sort(array[half..-1]))
end

def merge_arrays(left, right)
  results = []
  last_l, last_r = 0, 0
  while (last_l < left.length) && (last_r < right.length)
	if left[last_l] < right[last_r]
	  results << left[last_l]
	  last_l += 1
	else 
	  results << right[last_r]
	  last_r += 1
	end
  end
  results.concat(left[last_l..-1])
  results.concat(right[last_r..-1])
end

p merge_sort([9,5,0,0,1,-3,11,13,29,1000,24,15])
