defmodule Solution do
  require Integer
  def read(count, list) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | tail ] = Tuple.to_list(Integer.parse(data))
      count=count+1
      if Integer.is_even(count) do
        read(count, Enum.concat(list, [head]))
      else
        read(count, list)
      end
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



list=Solution.read(0, [])
Solution.print_data(list)
