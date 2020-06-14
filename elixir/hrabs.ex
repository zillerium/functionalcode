defmodule Solution do
  def read(list) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | tail ] = Tuple.to_list(Integer.parse(data))
      read(Enum.concat(list, [abs(head)]))
    end
  end




 def print_loop([]) do
 end
  def print_loop(list) do
    [head | tail] = list
    IO.puts(head)

    print_loop(tail)
  end



end

list = Solution.read([])
Solution.print_loop(list)
