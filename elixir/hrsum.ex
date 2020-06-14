defmodule Solution do
  require Integer
  def read(total) do
    case IO.read(:stdio, :line) do
      :eof -> total
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | _tail ] = Tuple.to_list(Integer.parse(data))
      if head.is_odd do
        read(total+head)
      else
        read(total)
      end
    end
  end



end



 Solution.read(0) |> IO.inspect




#Solution.print_data(0, 0, [1,2,3]) |> IO.inspect

