# O(n)
seq = [1, 2]
sum = 0
until seq[1] > 4000000 do
  sum += seq[1] if seq[1] % 2 == 0
  seq = [seq[1], seq[0] + seq[1]]
end
p sum
