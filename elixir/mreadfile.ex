defmodule Solution do

  def read_file() do

    File.stream!("test.csv")
    |> Enum.flat_map(&String.split(&1, " "))
    |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end)
    |> Enum.to_list()
    |> IO.inspect

  end



end

Solution.read_file()
