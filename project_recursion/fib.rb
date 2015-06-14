def fib_iterative(n)
  if n.to_i <= 2
	return [1] * n.to_i
  end
  (3..n).to_a.inject([1,1]) { |sequence, element| sequence << sequence[-1] + sequence[-2] }
end

def fib_recursive(n)
  return [1] * n.to_i if n.to_i <= 2
  last_number = fib_recursive(n - 1)
  last_number << last_number[-1] + last_number[-2]
end

p fib_recursive(12)
