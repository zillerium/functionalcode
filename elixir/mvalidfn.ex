defmodule Solution do

  def get_int do
    IO.read(:line)
    |> String.trim()
    |> String.to_integer

  end

  def test_data do
     1..get_int()
     |> Enum.map(fn _ -> IO.read(:line) end)
     |> Enum.map(&String.split/1)
     |> check_dups
  end

  def check_dups(list_pairs) do
    list_pairs
    |> Enum.reduce(%{}, fn [l, r], acc ->
      Map.get_and_update(acc, l, fn value ->
        {value,
         #if value !=nil do IO.puts "not nil ==>"; IO.inspect value; value++[r] else  IO.inspect [r]; IO.puts "#{[r]}"; [r] end  |> Enum.sort()
         if value !=nil do value++[r] else [r] end  |> Enum.sort()

        }
      end)
      |> elem(1)
    end)
  end

  def dup_found() do

  end


  def yesno (x) do
    if x == true do "YES" else "NO" end
  end
  def dup_check(map_values) do
   ## IO.inspect map_values
    map_values |> Enum.all?(fn {k, v} -> length(tl v) == 0  end ) |> yesno()
  #map_values
  #map_values |> IO.inspect
  #map_values |> Map.values()
  end

  def valid_fn do
    1..get_int()
    |> Enum.map(fn _ -> test_data() end)
    |> Enum.map(&dup_check/1)
    |> Enum.each(&IO.puts/1)
  end

end


Solution.valid_fn
