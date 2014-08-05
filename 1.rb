sum = 0
(1..999).to_a.each { |n|
  if n % 5 == 0 || n % 3 == 0
    sum += n
  end
}
p sum
