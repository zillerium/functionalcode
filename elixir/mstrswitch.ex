defmodule Solution do

def check(line) do
   String.codepoints(line)
   |> Enum.uniq()
   |> List.to_string()
   |> IO.puts()

end

def read_str(), do: IO.read(:line) |> String.trim()
def read_int do
  ##  IO.puts "reading data"
    IO.read(:line) |> String.trim() |> String.to_integer()
end

def process() do
  n = read_int()

    string_mgr(n)

end
def check(_, 0, _) do
# IO.puts "end =============="
end

def check(line, n, l) do
  s= String.slice(line, 1, l-1) <> String.slice(line, 0, 1)
   IO.write(s)
   IO.write(" ")
   #read_int()
   #IO.puts(n)
  check(s, n-1, l)
end
def string_mgr(0) do end
def string_mgr(n) do
  str = read_str()
  l = String.length(str)
  check(str, l, l)
  IO.puts ""
  string_mgr(n-1)
end

end

Solution.process()

