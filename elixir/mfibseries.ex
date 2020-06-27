defmodule Solution do

    def read_int do
    ##  IO.puts "reading data"
      IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def fib(0) do
    IO.puts "zero reached"
    0
  end
  def fib(1) do
    IO.puts "one reached"
    1
  end

  def fib(n) do
  i=read_int()
    IO.puts "n = #{n}"
    fib(n - 1) + fib(n - 2)
  end

  def process() do
    n = read_int()
    IO.puts fib(n)
  end


end

Solution.process()

