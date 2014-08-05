def is_divisible n
  (3..19).each { |f|
    return false unless n % f == 0
  }
  return true
end

n = 20
until is_divisible(n) do
  # Clear out the previous output
  print "\b" * n.to_s.length

  # Jump by 20s, since it has to be divisible by 20 anyway
  n += 20

  print n
end

# Answer: 232792560
