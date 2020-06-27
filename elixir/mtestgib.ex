defmodule Fib do
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do
    IO.read(:line) |> String.trim() |> String.to_integer()
    IO.puts "n= #{n}"
    fib(n-1) + fib(n-2)
  end
end

IO.puts Fib.fib(10)
