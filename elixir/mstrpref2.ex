defmodule Solution do

    a = IO.read(:stdio, :line) |> String.trim
    b = IO.read(:stdio, :line) |> String.trim
    count = Enum.zip(String.splitter(a,"", trim: true),String.splitter(b,"", trim: true))
     |> Stream.take_while(fn({a,b}) ->  a == b  end) |>  Enum.count

    IO.write count
    IO.write " "
    String.slice(a, 0, count) |> IO.puts

    alen = String.length(a)
    IO.write alen - count
    IO.write " "
    String.slice(a, count, alen) |> IO.puts

    blen = String.length(b)
    IO.write blen - count
    IO.write " "
    String.slice(b, count, blen) |> IO.puts

end
count = Enum.zip(String.splitter(a,"", trim: true),String.splitter(b,"", trim: true)) |> Stream.take_while(fn({a,b}) ->  a == b  end) |>  Enum.count
