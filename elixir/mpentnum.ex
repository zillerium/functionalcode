defmodule Solution do

  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def process_check(0) do

  end
  def process_check(count) do
    p = read_int()
    t = trunc(p * (3 * p - 1) / 2)
    IO.puts t

    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)
  end


end


Solution.check()
