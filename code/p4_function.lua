function mean(arg)
  sum = 0
  count = 0
  for i,v in ipairs(arg) do
    sum = sum + v
    count = count + 1
  end
  avg = sum/count
  return avg
end

nums = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
print(mean(nums))