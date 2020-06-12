defmodule Calc do
  def fact(0), do: 1
  def fact(a), do: a* fact(a-1)
end

defmodule ListUtils do

  def test1([]) do
      "testing"
  end

  def alt_max([ head | tail ]), do: alt_max(tail, head)

  def alt_max([head | tail ], current_max) when current_max < head do
    alt_max tail, head
  end

  def alt_max([head | tail ], current_max) when current_max >= head do
    alt_max tail, current_max
  end

  def alt_max([], current_max), do: current_max

  def max([ value | [ head | tail ] ]) when value < head do
    max [head | tail]
  end

  def max([ value | [ head | tail ] ]) when value >= head do
    max [value | tail]
  end

  def max([value]), do: value

  def map([], _fun), do: []

  def map([head | tail], fun) do
    [ fun.(head) | map(tail, fun) ]
  end

  def mult([]), do: 1
  def mult([head | tail]) do
    head * mult(tail)
  end
end

ListUtils.alt_max([1,2,8,90,8,9]) |> IO.inspect
#ListUtils.map([2,3,4], &(&1 * 3)) |> IO.inspect
#ListUtils.mult([1,2,3]) |> IO.puts

