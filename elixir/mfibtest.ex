defmodule Solution do

    def read_int do
    ##  IO.puts "reading data"
      IO.read(:line) |> String.trim() |> String.to_integer()
    end
    def fib(n) when n==0 do
      # IO.puts "zero reached"
       0
     end
  def fib(n) when n==1 do
   # IO.puts "zero reached"
    0
  end
  def fib(n) when n==2 do
  #  IO.puts "one reached"
    1
  end

  def fib(n) do
  ##i=read_int()
    ##IO.puts "n = #{n}"
    ##IO.puts "n - 1 = #{n-1}"
    fib(n - 1) + fib(n - 2)
  end

  def process() do
    n = read_int()
    IO.puts fib(n)
  end


end

Solution.process()

