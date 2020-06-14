defmodule Solution do
  require Integer
  def read() do
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | _tail ] = Tuple.to_list(Integer.parse(data))
      head
    end
  end

  def print_data(_, 0, list) do
    list
  end

  def print_data(number_print, count, list) do
    number_print=number_print+1

    print_data(number_print, count-1, Enum.concat(list, [number_print]))
  end

end



count=Solution.read()
if count < 0 do
  Solution.print_data(0, 0, []) |> IO.inspect
else
  Solution.print_data(0, count, []) |> IO.inspect(limit: :infinity)


end
#Solution.print_data(0, 0, [1,2,3]) |> IO.inspect

