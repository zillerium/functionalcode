defmodule Solution do

  def read_str(), do: IO.read(:line) |> String.trim()

  def str1([],[], r, _n)   do
    r
  end
  def stop() do

  end
  def str1([x1 | x2], [y1 | y2], r, n) do
    #Enum.map(x, fn x ->x<>v end)
    #if n>10 do stop() end
    str1(x2, y2, r<> x1 <> y1 , n+1)

  end

def solve() do

    str1x = read_str()
    str2x = read_str()

    list1 = String.graphemes(str1x)
    list2 = String.graphemes(str2x)

    x = str1(list1, list2, "", 0)
    IO.puts "#{x}"
   # IO.puts "#{str1x}"
   # IO.puts "#{str2x}"

end

end

Solution.solve()


