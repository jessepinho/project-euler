a = 100
b = 100
answer = a * b
while b < 1000 do
  if (a < 1000)
    a += 1
  else
    a = 100
    b +=1
  end
  product = a * b
  if product.to_s == product.to_s.reverse
    if product > answer
      answer = product
    end
  end
end
p answer
