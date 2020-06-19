defmodule Solution do
require IEx
  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def read_test_case() do
  #1..2
    1..read_int()
    |> Enum.map(fn _ -> IO.read(:line) end) # this will iterate over the piped values into a list
    |> Enum.map(&String.split/1)
    |> gather_pairs
  end

  def test1() do

  IO.inspect "kk"
  end

  def testdebug(test_case) do

    test_case |> IO.inspect

    test_case
    |> Enum.reduce(%{}, fn [l, r], acc ->
     IO.puts  "l = #{inspect([l])}"
     IO.inspect([l],
     label: "l",
      limit: :infinity,
      pretty: true,
      printable_limit: :infinity,
      structs: false,
      width: 0
     )
     IEx.pry()
     #IO.warn("related path: #{inspect(related_attribute_path)}")
     # IO.inspect [r]
     # IO.inspect acc
      Map.get_and_update(acc, l, fn value ->
        #IO.inspect {value, [r]}
        {value, [r]} |> Enum.uniq()
          end)
          end)
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
    |> IO.inspect
   # |> Enum.all?(fn x -> length(x) == 1 end)
  end

  def to_yes_no(b) do
    if b == true do
      "YES"
    else
      "NO"
    end
  end

  def run do
  #read_test_case()
    1..read_int()
    |> Enum.map(fn _ -> read_test_case() end) |> IO.inspect
    |> Enum.map(&is_func/1)
   # |> Enum.map(&to_yes_no/1)
   # |> Enum.each(&IO.puts/1)
  end
end

Solution.run()

