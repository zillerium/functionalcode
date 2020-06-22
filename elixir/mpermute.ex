defmodule Solution do

  def read_int do
    IO.read(:line)
    |> String.trim()
  end

  def read_str(), do: IO.read(:line) |> String.trim()

    def main do
        a = :io.get_line('') |> String.codepoints
        b = :io.get_line('') |> String.codepoints
        Enum.zip(a,b)
          |> Enum.flat_map(&[elem(&1,0),elem(&1,1)])
          |> IO.puts
    end

    def listman([],s, _pr, _n,_c) do
      s
    end

    def stop() do

    end

    def listman([p|q], s, pr, n, c) do
      #if c> 100 do stop() end
      if n == 1 do
        listman(q, s<>p<>pr, "", 0, c+1)
      else
        listman(q, s, p, n+1,c+1)
      end


    end

    def strman() do
      str = read_str()
      list = String.graphemes(str)
      s = listman(list, "", 0, 0, 0)
      IO.puts "#{s}"
    end

    def solve() do
      1..read_int()
        |> Enum.map(fn _ -> strman() end)
    end

end

Solution.solve()
