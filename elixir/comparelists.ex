defmodule Solution do

    def read_int do
    ##  IO.puts "reading data"
      IO.read(:line) |> String.trim() |> String.to_integer()
    end

    def read_str do

      IO.read(:line) |> String.trim() |> String.split()
      # |> IO.inspect
       |> Enum.map(fn x -> String.to_integer(x) end)

    end

    def compare([h|t], [h1|t1]) do

    end

    def main() do
      n = read_int()
      s = read_str()
      IO.inspect s
      m = read_int()
      t = read_str()
      IO.inspect t


    end

end

Solution.main()
