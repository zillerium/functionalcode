defmodule Solution do
  def read(list) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | tail ] = Tuple.to_list(Integer.parse(data))
      read(Enum.concat(list, [head]))
    end
  end

  def write_loop(_, 0) do
  end

  def write_loop(data) do
    IO.puts("#{data}")
    write_loop(data)
  end

  def print_loop(0, list) do
  end
 def print_loop(_, []) do
 end
  def print_loop(count, list) do
    [head | tail] = list
    print_data(count, head)

    print_loop(count,tail)
  end
  def print_data(0, _) do
  end

  def print_data(count, head) do
    IO.puts(head)
    print_data(count-1, head)
  end

end

[count | list ] = Solution.read([])
Solution.print_loop(count, list)
