defmodule Solution do

    def read_int do
    ##  IO.puts "reading data"
      IO.read(:line) |> String.trim() |> String.to_integer()
    end





  def process() do
    n = read_int()
    m = read_int()
    IO.puts n + m
  end


end

Solution.process()

