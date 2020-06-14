defmodule Solution do
  require Integer
  def read(list) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | _tail ] = Tuple.to_list(Integer.parse(data))
      read(Enum.concat([head], list))
    end
  end

  def print_data(_, 0, list) do
    list
  end

  def print_data(number_print, count, list) do
    number_print=number_print+1

    print_data(number_print, count-1, Enum.concat(list, [number_print]))
  end




 def print_loop([]) do
 end
  def print_loop(list) do
    [head | tail] = list
    IO.puts(head)

    print_loop(tail)
  end


end



list=Solution.read([])
Solution.print_loop(list)



#Solution.print_data(0, 0, [1,2,3]) |> IO.inspect

