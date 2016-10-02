defmodule Person do
  @moduledoc """
    This module has examples of Elixir def implamentation
  """

  @doc """
    Function responsible for to greet somebody
  """
  def to_greet(%{name: name}) do
    "Hello, #{name}"
  end

  @spec
  def alcoholic_drink(%{age: age}) when age > 18, do: :ok
  def alcoholic_drink(%{age: age}), do: :error

  @vsn 1.0
  def identify_hand({{a, _}, {a, _}, {a, _}, {a, _}, {a, _}}) do
    :flush
  end
end
