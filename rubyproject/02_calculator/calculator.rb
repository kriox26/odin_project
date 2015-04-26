def add(par1,par2)
  return par2 + par1
end

def subtract(par1,par2)
  return par1 - par2
end

def sum(array)
  total = 0
  if array.length == 0
    return 0
  else
    array.each do |number|
      total = total + number
    end
    return total.to_int
  end
end

def multiply(array)
  total = 1
  if array.length == 0
    return 0
  else
    array.each do |number|
      total *= number
    end
    return total.to_int
  end
end

def power(base,power)
  total = 1
  power.times do 
    total *= base
  end
  return total
end

def factorial(number)
  total = 1
  if number == 0
    return 1
  else
    while number >= 1
      total *= number
      number -= 1
    end
    return total
  end
end


