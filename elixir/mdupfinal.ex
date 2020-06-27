defmodule Solution do

def pop_value(map, x) do
  if x == 3742 do
    IO.write "==== 3742 found #{x} #{map[x]} ===== "
  end
end

def duplicates(list) do
  acc_dupes = fn(x, dupes) ->
  #  dupes |> IO.inspect(label: "dupes ")
    case Map.has_key?(dupes, x) do
      true ->   Map.put(dupes, x, dupes[x]+1)
      false ->  Map.put(dupes, x, 1)
    end
  end
  #list |> Enum.reduce({%{}, %{}}, acc_dupes) |> elem(2) |> Map.values() |> IO.inspect
 ## IO.puts "new line"
  list |> Enum.reduce(%{}, acc_dupes)
  #(2) |> Map.values() |> IO.inspect
end

def test_key(unmat, mapA, mapB, x) do
  IO.write "#{x} "
  case Map.has_key?(unmat, x) do
    true -> unmat
    false ->  Map.put(unmat, x, 1)
  end
end

def test_value(unmat, mapA, mapB, x) do

    case Map.has_key?(unmat, x) do
      true -> unmat
      false ->  Map.put(unmat, x, 1)
    end

end

def test_key_check(unmat, mapA, mapB, x) do
  case Map.fetch!(mapA, x) != Map.fetch!(mapB, x) do
    true -> test_value(unmat, mapA, mapB, x)
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



  def read_int do
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def read_strxxx() do
    IO.read(:line) |> String.trim()
     #|> String.split()
     #|> Enum.map(fn x -> String.to_integer(x) end)
  end

  def read_str1x() do

  end

  def read_str() do

    IO.read(:line) |> String.trim() |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)

  #  for line <- IO.stream(:stdio, :line) do
  #    line |> String.trim |> IO.inspect
  #  end


      #Enum.each(IO.stream(:stdio, :line), String.trim(:line) |> String.split |> String.to_integer() )
      ##IO.stream(:stdio, :line) -> line |> String.trim() |> String.split() |> String.to_integer |> Enum.map(fn x -> String.to_integer(x) end)

  end


def print_map([]) do

end

def print_map([h|t]) do
   IO.write "#{h} "
   print_map(t)
end

def process() do

  n = read_int()
  listA = read_str()
  m = read_int()
  listB = read_str()
  #IO.puts length(listA)

  #IO.inspect length(listA)
  #IO.inspect length(listB)


   #f1 = Enum.filter(listA, fn(x) -> x == 3742 end)

   #f2 = Enum.filter(listB, fn(x) -> x == 3742 end)

   #IO.inspect f1
   #IO.inspect f2

  mapA = duplicates(listA)
  mapB = duplicates(listB)
  ##IO.puts " 3742 A = #{mapA[3742]}"
  ##IO.puts " 3742 B = #{mapB[3742]}"
 # IO.inspect mapA
 # IO.inspect mapB
 # IO.inspect listB
  dupMap = match_map(listB, mapA, mapB)
##  IO.puts "answer==="
##IO.inspect dupMap
 print_map(Map.keys(dupMap))
 # dupMaeys p = dups(listB, [], mapA, mapB, %{})
 ##dupkeys = Map.keys(dupMap)
 # IO.puts "key #{x}"
#  IO.inspect dupkeys

end

end

Solution.process()
#IO.inspect(mapA)
#IO.inspect(mapB)
#IO.inspect(listB1)
#Solution.check(listB, mapA, mapB)
