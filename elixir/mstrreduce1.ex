defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
  IO.gets("") |> String.codepoints |> Enum.uniq |> Enum.join |> IO.puts
end
