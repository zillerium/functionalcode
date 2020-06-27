defmodule Solution do

def duplicates(list) do
  acc_dupes = fn(x, dupes) ->
  #  dupes |> IO.inspect(label: "dupes ")
    case Map.has_key?(dupes, x) do
      true ->  Map.put(dupes, x, dupes[x]+1)
      false -> Map.put(dupes, x, 1)
    end
  end
  #list |> Enum.reduce({%{}, %{}}, acc_dupes) |> elem(2) |> Map.values() |> IO.inspect
  list |> Enum.reduce(%{}, acc_dupes)
  #(2) |> Map.values() |> IO.inspect
end

def test_key(unmat, mapA, mapB, x) do
  IO.write "#{x} "
  Map.put(unmat, x, 1)
end

def test_key_check(unmat, mapA, mapB, x) do
  case Map.fetch!(mapA, x) == Map.fetch!(mapB, x) do
    true -> IO.write "#{x} "; Map.put(unmat, x, 1)
    false -> unmat
  end
end

def match_map(list, mapA, mapB) do

  unmatched_keys = fn(x, unmat) ->
   # IO.inspect mapA
   # IO.inspect unmat
    case Map.has_key?(mapA, x) do
     #  true -> IO.puts "matched";if Map.fetch!(mapA, x) == Map.fetch!(mapB, x) do Map.put(unmat, x, 1) end
     #  false -> unmat |> IO.inspect(label: "unmatched"); Map.put(unmat, x, 1)
     true -> test_key_check(unmat, mapA, mapB, x)
     false -> test_key(unmat, mapA, mapB, x)
     #Map.put(unmat, x, 1);
    end
  end
  #IO.inspect list
  #IO.inspect mapA
  #IO.inspect mapB
  list |> Enum.reduce(%{}, unmatched_keys)
end

def check(listB, mapA, mapB) do

  acc_dupes = fn(x, mapA) ->
   # IO.puts "loop values"
   # IO.puts "x= #{x}"
   # IO.inspect mapA
    #case Map.has_key?(mapA, x) do
    #  true ->
        # if mapA[x] != mapB[x] do
    #      IO.puts "match #{x}"
        #end
    #  false -> IO.puts "#{x}"
    #end
  end
  #IO.puts "preloop"
  #IO.inspect mapA
    listB |> Enum.reduce(  mapA, acc_dupes)

end

def addValue(map, value) do
  if (Map.has_key?(map, value)) do
    IO.puts "not == add map value #{value}"
    IO.write "#{value} "
  else
    Map.put(map, value, 1)
    IO.puts "add map value #{value}"
    IO.write "#{value} "
  end
  IO.puts "added values into map"
  #IO.inspect map
  map
end

def compare_keys(value1, mapA, mapB, finalMap) do

  IO.puts "final map"
  IO.inspect finalMap
  accdups = fn value ->
  case Map.has_key?(mapA, value) do
    true ->      #
       if mapA[value] != mapB[value] do
          IO.puts "compare value1 #{value}"

          finalMap=addValue(finalMap, value)
          IO.inspect finalMap

      end
    false ->   IO.puts "compare value2 #{value}";finalMap=addValue(finalMap, value);  IO.inspect finalMap
  end
  end
  IO.puts "accdups"
  IO.inspect accdups.(value1)



end

def dups([[]], list, mapA, mapB, finalMap) do
  finalMap
end

def dups([x| []], list, mapA, mapB, finalMap) do
   compare_keys(x, mapA, mapB, finalMap)
end

def dups([h|t], list, mapA, mapB, finalMap) do
  x = hd t
  if h == x do
    dups(t,   list, mapA, mapB, finalMap)
  else
    dups(t,   list ++ [h], mapA, mapB, compare_keys(h, mapA, mapB, finalMap))
  end
end

  def read_int do
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def read_str do
    IO.read(:line) |> String.trim() |> String.split()
     |> Enum.map(fn x -> String.to_integer(x) end)
  end



def process() do

  n = read_int()
  listA = read_str()
  m = read_int()
  listB = read_str()
  mapA = duplicates(listA)
  mapB = duplicates(listB)
  dupMap = match_map(listB, mapA, mapB)
 # dupMaeys p = dups(listB, [], mapA, mapB, %{})
 dupkeys = Map.keys(dupMap)
 # IO.puts "key #{x}"
#  IO.inspect dupkeys

end

end

Solution.process()
#IO.inspect(mapA)
#IO.inspect(mapB)
#IO.inspect(listB1)
#Solution.check(listB, mapA, mapB)
