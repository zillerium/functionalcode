defmodule Solution do

  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def read_ints() do

      IO.read(:line) |> String.trim() |> String.split()
     # |> IO.inspect
      |> Enum.map(fn x -> String.to_integer(x) end)




       ##|> Enum.map( fn [l, r] -> [l,r] |> Enum.map(&String.to_integer/1) end)


  end

  def most_common1(list) when is_list(list) do
    {amts, highest_count, highest_values} =
      Enum.reduce(list, {%{}, 0, []}, fn(v, {a, hc, hv}) ->
        case Map.update(a, v, 1, &(&1+1)) do
          %{^v => ^hc}=a -> {a, hc, [v | hv]}
          %{^v => c}=a when c>hc -> {a, c, [v]}
          a -> {a, hc, hv}
        end
      end)
    # Now we have all the interesting bits, the example code in the first post just prints though...
    if map_size(amts) == length(highest_values) do
      IO.puts("All elements have the same frequency in list: #{inspect list}")
    else
      IO.puts("Most common elements are #{inspect highest_values} with frequency #{highest_count}")
    end
  end

  def most_common(list) when is_list(list) do
    {amts, highest_count, highest_values} =
      Enum.reduce(list, {%{}, 0, []}, fn(v, {a, hc, hv}) ->
        case Map.update(a, v, 1, &(&1+1)) do
          %{^v => ^hc}=a -> {a, hc, [v | hv]}
          %{^v => c}=a when c>hc -> {a, c, [v]}
          a -> {a, hc, hv}
        end
      end)
    # Now we have all the interesting bits, the example code in the first post just prints though...
    if map_size(amts) == length(highest_values) do
      IO.puts("All elements have the same frequency in list: #{inspect list}")
    else
      IO.puts("Most common elements are #{inspect highest_values} with frequency #{highest_count}")
    end
  end
  def process_check(0) do

  end
  def process_check(count) do
    test_plan = read_ints()
    test_data = read_ints()
    check_dups(test_data, test_plan)
    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)

   #   IO.inspect test_data
   #   IO.inspect test_plan

   # IO.inspect test_plan
   # IO.inspect test_data
  end

  def check_dups(list, [_size, count]) do
    list1=list
 #   IO.inspect list
   dups= Enum.reduce(list,%{}, fn x, acc
   -> Map.update(acc, x, 1, fn y -> y+1 end ) end)
  # IO.inspect dups
 #  IO.inspect list
   filter_dups(list,dups,count)
  end

  def filter_dups(list, dups, count) do
    newmap = :maps.filter fn _, v -> v >= count end, dups
   # IO.inspect newmap
    dup_keys=Map.keys(newmap)
   # IO.inspect list
  #  IO.inspect dup_keys
    print_keys(list, dup_keys, dup_keys)

  end

  def print_keys(list, [], []) do
    IO.puts "-1"
  end

  def print_keys(list, dup_keys, dup_keys) do
    checklist(list, dup_keys, dup_keys)
  end
  def checklist(_, _, []) do
    #  IO.puts "final end"
    IO.puts " "

    end
  def checklist([], [], []) do
  #  IO.puts "final end"
  IO.puts " "

  end
  def checklist([h|t], [], allkeys) do
   # IO.puts "end keys"
   # IO.inspect [h|t]
  #  IO.inspect allkeys
    checklist(t, allkeys, allkeys)
  end

  def checklist(list, [key|keys], allkeys) do
    [h|rest_list]=list
  #  d=read_int()
   # IO.inspect list

   # IO.inspect rest_list
  #  IO.puts "h = #{h} k = #{key} t #{allkeys}"
    if (h==key) do
      IO.write key
      IO.write " "
     # IO.inspect allkeys
      nkeys =  Enum.filter(allkeys, fn c -> c != key end)
      checklist(rest_list, nkeys, nkeys)
    else
      checklist([h|rest_list], keys, allkeys)
    end


  end

  #def x() do
  #  def to_nested_map(list) do
  #    Enum.reduce list, %{}, fn %{k: key, v: value}, acc ->
  #      key_path = key |> String.split(".") |> Enum.map(&Access.key(&1, %{}))
  #      put_in(acc, key_path, value)
  #    end
  #  end

  #end

 # Enum.reduce(yy, %{}, fn %{k: key, v: value}, acc -> key_path = key
 # |> String.split(".") |> Enum.map(&Access.key(&1, %{}))
 # Access.put_in(acc, key_path, value) end)


  ##:maps.filter fn _, v -> v > 1 end, yy

   ##yy= Enum.reduce(j,%{}, fn x, acc -> Map.update(acc, x, 1, fn y -> y+1 end ) end)



  def duplicates1(list) do
    acc_dupes = fn(x, {elems, dupes}) ->
      case Map.has_key?(elems, x) do
        true -> {elems, Map.put(dupes, x, nil)}
        false -> {Map.put(elems, x, nil), dupes}
      end
    end

    list |> Enum.reduce({%{}, %{}}, acc_dupes) |> elem(1) |> Map.keys()
  end

  def duplicates([count|list]) do
    acc_dupes = fn(x,{elems, dupes}) ->
      IO.puts "#{count}"
      case Map.has_key?(elems, x) do
        true -> {elems, Map.put(dupes, x, nil)}
        false -> {Map.put(elems, x, nil), dupes}
      end
    end
   # IO.inspect acc_dupes
    [3]++list |> Enum.reduce({%{}, %{}}, acc_dupes) |> elem(1) |> IO.inspect
    #|> Map.keys() |> IO.inspect
  end

end


Solution.check()
