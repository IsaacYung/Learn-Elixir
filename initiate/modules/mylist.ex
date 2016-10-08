defmodule MyList do
  def​ sum2(list), ​do​: _sum2(list, 0)
  ​
  # private methods​
  defp​ _sum2([], total),              ​do​: total
  defp​ _sum2([ head | tail ], total), ​do​: _sum2(tail, head+total)
end
