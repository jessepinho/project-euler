require 'prime'

n = 600851475143
half = (n.to_f / 2.0).floor
largest_prime_factor = 0
(0..half).each do |f|
  if f.prime? && n % f == 0
    largest_prime_factor = f
  end
end
p largest_prime_factor

# todo: write own version of prime?(); figure out efficient method for identify-
# ing prime factors
