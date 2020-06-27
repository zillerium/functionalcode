defmodule Solution do

    def filter_elements do
        IO.read(:stdio, :line) # read n
        a = IO.read(:stdio, :line)
        IO.read(:stdio, :line) # read m
        b = IO.read(:stdio, :line)

        dic = b |> String.trim |> String.split(" ", trim: true)
         |> Enum.map(fn(x) -> Integer.parse(x) end) |>  Enum.map(fn({x,_}) -> x end)
         |> Enum.reduce(%{}, &Solution.count_frequency/2)


        a |> String.trim |> String.split(" ", trim: true)
         |> Enum.map(fn(x) -> Integer.parse(x) end) |>  Enum.map(fn({x,_}) -> x end)
         |> Enum.reduce(dic, &Solution.reduce_frequency/2)
         |> Map.values
         |> Enum.filter(fn({_,count}) -> count > 0 end)
         |> Enum.map(fn({x,_}) -> x end)
         |> Enum.sort(fn(i,j) -> i <= j end)
         |> print

    end

    def print([]) do
        IO.puts ""
    end

    def print([h|t]) do
        IO.write h
        case t do
            [] ->
              IO.puts ""
            [_|_] ->
              IO.write " "
              print t
        end
    end

    def count_frequency(x,m) do
        f = Map.fetch(m,x)
        case f do
            {:ok, v} ->
                {n , count}  = v
                Map.put(m, x, {n , count+1})
            :error ->
                Map.put(m, x, {x , 1})
        end
    end

    def reduce_frequency(x,m) do
        {n, count} = Map.fetch!(m,x)
        Map.put(m, x, {n, count-1})
    end

end


Solution.filter_elements
