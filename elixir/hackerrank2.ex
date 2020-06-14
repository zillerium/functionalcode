defmodule Solution do
  def read(delim, list) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | tail ] = Tuple.to_list(Integer.parse(data))
      if head < delim do
        read(delim, Enum.concat(list, [head]))
      else
        read(delim, list)
      end
    end
  end

  def read([]) do
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | tail ] = Tuple.to_list(Integer.parse(data))
      head
    end
  end


  def print_data([]) do
  end

  def print_data(list) do
    [head | tail] = list
    IO.puts(head)
    print_data(tail)
  end

end

delim  = Solution.read([])

list=Solution.read(delim, [])
Solution.print_data(list)
