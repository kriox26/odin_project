require 'benchmark'
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

array = []
999999.times do |i|
  array[i] = rand(50000)
end
Benchmark.bmbm do |bm|
  bm.report("merge") do
	merge_sort(array)
  end
end
