
defmodule Demo do
  require Map
  def update do
    newmap = %{ map() | title: "other", year: 2018}
    newmap
  end

  def read_pair(map_pr) do
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##line is pair or a count
      ##g = data * 3
      [ k | [v | _tail ]] = Tuple.to_list(Integer.parse(data))
      Map.put(map_pr, k, v)
    end
  end

  def create_map(map_pr, 0) do


  end
  def create_map(map_pr, count) do
      create_map(read_pair(map_pr), count-1)
  end



  def pattern_matching do
    #%{ title: my_title } = map()
    #my_title
    %{ title: _} = map()

  end

  def keys do
    map() |> Map.keys

  end

  def merge do
    map() |> Map.merge(%{some: "data"})

  end

  def has_key do
    map() |> Map.has_key?(:year)

  end

  def get do
    Map.get map(), :title
  end

  def map do
    %{ title: "Titanic", year: 1997}
  end
  def addkv(k, v, map1) do

  Map.put( map1,  k,  v)

  end

end
##Demo.update |> IO.inspect
k=1
v=2
map1=%{}
Demo.addkv(k, v , map1) |> IO.inspect
Demo.addkv(k, v , map1) |> IO.inspect
