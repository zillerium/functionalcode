defmodule Fib do
use Agent

  def read_int do
  ##  IO.puts "reading data"
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def start do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: __MODULE__)
  end
  def fib(n) do
    cached_value = Agent.get(__MODULE__, &(Map.get(&1, n)))
    if cached_value do
      cached_value
    else
      v = fib(n - 1) + fib(n - 2)
      Agent.update(__MODULE__, &(Map.put(&1, n, v)))
      v
    end
  end
  def process_check(0) do

  end
  def process_check(count) do
    n = read_int()
    mod1 = trunc(:math.pow(10, 8) + 7)
    x = fib(n)
   # IO.puts "value = #{x}"
    y = rem(x, mod1)
    IO.puts y

    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)
  end

end
{:ok, _} = Fib.start
Fib.check()
