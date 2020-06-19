defmodule Solution do
    def read() do
        IO.gets(nil)
        |> String.trim
        |> String.split
        |> Enum.map(&String.to_integer/1)
    end

    def solve() do
        [num_sides] = read()
        [init | _] = sides = for _ <- 1..num_sides, do: read

        # ensure that I iterate past the last point
        {{x_sums, y_sums}, _} = Enum.reduce(
            sides ++ [init],
            {{1,1}, init},
            fn ([x2, y2] = current, {{x_acc, y_acc}, [x1, y1] = _last_point}) ->
                {{x_acc + (x1 * y2), y_acc + (x2 * y1)}, current}
            end)
        abs((y_sums - x_sums) / 2)
    end

end

Solution.solve
|> inspect
|> IO.puts
