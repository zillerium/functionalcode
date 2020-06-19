defmodule Solution do
    def solve(list, pp\\[], acc\\0)

    def solve(list, _pp, acc) when length(list)==0 do
      IO.puts "module 2 ----------"
        acc
    end

    def solve([first|rest],pp, acc) when length(pp)==0 do
      IO.puts "module 1 ----------"
      IO.inspect first
      IO.inspect rest
      IO.inspect pp
      IO.inspect acc
      IO.puts "module 1 cc----------"
      x = rest ++ [first]
      IO.inspect x
        solve(rest++[first], first, acc)
        IO.puts "module 1 xx----------"
    end

    def solve([[x1,y1]|rest], [x2, y2], acc) do
      IO.puts "==================="
      IO.inspect x1
      IO.inspect y1
      IO.inspect x2
      IO.inspect y2
      IO.inspect rest
      IO.puts "===================="
        dist = :math.sqrt(:math.pow(x2-x1,2)+:math.pow(y2-y1,2))
        solve(rest,[x1,y1],acc+dist)
    end

end

[_ | rest] = IO.read(:stdio, :all) |> String.split

rest
|> Enum.map(&String.to_integer(&1))
|> Enum.chunk_every(2)
|> Solution.solve
|> IO.puts
