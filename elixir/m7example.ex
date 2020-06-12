defmodule ListUtils do

  def alt_mult(list), do: do_alt_mult([1 | list])

  defp do_alt_mult([ current_val | []]), do: current_val

  defp do_alt_mult([current_val, head | tail]) do
    new_current_val = current_val * head
    do_alt_mult [new_current_val | tail ]
  end

  def mult1() do
    mult1() # tail call
  end

  def mult(list), do: do_mult(1, list)

  defp do_mult(current_val, []), do: current_val

  defp do_mult(current_val, [head | tail]) do
    do_mult(current_val * head, tail)
  end



end

ListUtils.mult([1,2,3,4]) |> IO.inspect
