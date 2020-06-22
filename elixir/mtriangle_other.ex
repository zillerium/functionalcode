defmodule Solution do

  def get_integer() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
  end

  def factorial(0), do: 1
  def factorial(1), do: 1

  def factorial(n) when(n>1) do
      n * factorial(n-1)
  end

  def triangle(1), do: "1 "
  def triangle(n) do
    Enum.each(0..n-1, fn(r)-> IO.puts "#{String.trim(triangle_row(r))}" end)
  end

  def triangle_row(n) do
    Enum.reduce(0..n, "", fn(r,acc)-> acc <> to_string(round(factorial(n)/(factorial(r)*factorial(n-r)))) <> " " end)
  end
end

n = Solution.get_integer()
Solution.triangle(n)
