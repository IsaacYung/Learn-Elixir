defmodule Lists do
  def count([]), do: 0
  def count([_first | rest]) do
      1 + count(rest)
  end

  def count_opt(list) do
    count_opt(list, 0)
  end

  def count_opt([], amount), do: amount
  def count_opt([_p | rest], amount) do
    count_opt(rest, amount + 1)
  end

end

IO.puts Lists.count([1, 2, 3])
