sum_of_squares = (1..100).reduce(0) { |sum, n| sum + n ** 2 }
square_of_sums = (1..100).reduce(:+) ** 2
p square_of_sums - sum_of_squares

# Answer: 25164150
