list = [1, 2, 3, 4]

IO.inspect Enum.map(list, fn num ->
  num * 2
end)

IO.inspect Enum.filter(list, fn num ->
  num > 2
end)
