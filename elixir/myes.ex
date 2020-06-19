defmodule Solution do
  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def read_test_case() do
   # 1..read_int()
   1..2
    |> Enum.map(fn _ -> IO.read(:line) end)
    |> Enum.map(&String.split/1) |> IO.inspect
    # |> gather_pairs
  end

  def gather_pairs(test_case) do
    test_case
    |> Enum.reduce(%{}, fn [l, r], acc ->
      Map.get_and_update(acc, l, fn value ->
        {value,
         case value do
           nil -> [r]
           v -> v ++ [r]
         end
         |> Enum.uniq()}
      end)
      |> elem(1)
    end)
  end

  def is_func(test_case) do
    test_case
    |> Map.values()
    |> Enum.all?(fn x -> length(x) == 1 end)
  end

  def to_yes_no(b) do
    if b == true do
      "YES"
    else
      "NO"
    end
  end

  def run do
    1..read_int()
    |> Enum.map(fn _ -> read_test_case() end)
   # |> Enum.map(&is_func/1)
    #|> Enum.map(&to_yes_no/1)
    #|> Enum.each(&IO.puts/1)
  end
end

Solution.run()

