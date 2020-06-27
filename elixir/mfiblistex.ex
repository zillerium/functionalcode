defmodule Solution do
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n), do: do_fibonacci([1, 0], n - 1)

  defp do_fibonacci([head | _rest], 0) do
    rem(head, round(:math.pow(10, 8) + 7))
  end

  defp do_fibonacci(terms = [n_1, n_2 | _rest], n) do
    do_fibonacci([n_1 + n_2 | terms], n - 1)
  end
end

_ = IO.gets("") |> String.trim |> String.to_integer

for line <- IO.stream(:stdio, :line) do
  line |> String.trim |> String.to_integer |> Solution.fibonacci |> IO.puts
end
