defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
n = String.to_integer IO.gets ""
1..n |> Enum.each(fn _ -> IO.puts "Hello World" end)
end
