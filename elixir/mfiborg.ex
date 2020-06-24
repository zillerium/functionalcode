defmodule Solution do
  use Memoizer
  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def fib(0), do: 0

  def fib(1), do: 1

  defmemo fib(n) do

    x = trunc(:math.pow(10, 8) + 7)
    rem(rem(fib(n-1), x) + rem(fib(n-2), x), x)
   # rem(rem(10, x) + rem(fib(n-2), x), x)
  end


  def process_check(0), do: 1

  def process_check(count) do
    n = read_int()
    t = fib(n)
    IO.inspect t
    IO.puts "total = #{t}"
    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)
  end

end


Solution.check()
