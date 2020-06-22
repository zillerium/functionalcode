defmodule Solution do
    def solve(x, y) do
        cond do
            x == y -> x
            x > y  -> solve(x - y, y)
            :else  -> solve(x, y - x)
        end
    end
end

[x, y] =
    IO.gets("")
    |> String.split(" ")
    |> Enum.map(fn(n) -> {n, _} = Integer.parse(n); n end)

Solution.solve(x, y) |> IO.puts
