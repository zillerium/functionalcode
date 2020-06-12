defmodule Calc do
  def fact(a), do: do_fact(1, a)

  defp do_fact(result, 0), do: result

  defp do_fact(result, a) do
    result * a |> do_fact(a-1)
  end

end

Calc.fact(200) |> IO.inspect
