require 'benchmark/ips'
def merge_sort(array)
  return array if array.length <= 1
  half = array.length / 2
  merge_arrays(merge_sort(array[0..half-1]),merge_sort(array[half..-1]))
end

def merge_arrays(left, right)
  sorted = []
  until left.empty? or right.empty?
	left.first <= right.first ? sorted << left.shift : sorted << right.shift
  end
  sorted + left + right
end

array = (0..50000).to_a.shuffle
puts "50000 elements"
Benchmark.ips do |bm|
  bm.report("50000 elements") do
	merge_sort(array)
  end
end
