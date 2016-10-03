defmodule Colections do
  import Enum, only: [map: 2, filter: 2, sort: 2]

  def run(list) do
    list
    |> map(&(&1 * 2))
    |> filter(&(&1 > 2))
    |> sort(&(&1 > &2))
  end
end
