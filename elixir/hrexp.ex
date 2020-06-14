defmodule Solution do
  def read(list, series_count) do
    case IO.read(:stdio, :line) do
      :eof -> list
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | _tail ] = Tuple.to_list(Float.parse(data))
      #IO.inspect "series count"
      #IO.inspect series_count
      read(Enum.concat(list, [series_tot(0.0000,head, series_count-1)]), series_count)
    end
  end

  def read1() do
    case IO.read(:stdio, :line) do
      :eof -> :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
      ##read([data]++list)
      ##g = data * 3
      [head | _tail ] = Tuple.to_list(Float.parse(data))
      head
    end
  end

  def series_tot(total, _, 0), do: total + 1

  def series_tot(total, x, n) do
  #IO.inspect "n = "
  #IO.inspect  n
   #IO.inspect "x = "
  #IO.inspect  x
    #IO.inspect "total = "
  #IO.inspect  total

  #IO.inspect "fact = "
    #fact(n) |> IO.inspect
     # IO.inspect "power = "
    #pow(x, n) |> IO.inspect

    series_tot(total + (pow(x, n)/fact(n)), x, n-1)
  end
  # :math.pow fails for large numbers
  def pow(_, 0) do
    1
  end
  #def pow(x, n) when Integer.is_odd(n) do
  def pow(x, n) do
    x * pow(x, n-1)
  end
  ##def pow(x, n) do
  ##  result=pow(x, div(n, 2))
  ##  result * result
  ##end

  def fact(0), do: 1
  def fact(n) when n> 0 do
    n * fact(n-1)
  end

  def print_loop([]) do
  end

  def print_loop(list) do
    [head | tail] = list
    IO.puts(head)

    print_loop(tail)
  end



end

_count = Solution.read1() # not used
list = Solution.read([], 10)

Solution.print_loop(list)
