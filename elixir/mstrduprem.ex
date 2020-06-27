defmodule Solution do

def check(line) do
   String.codepoints(line)
   |> Enum.uniq()
   |> List.to_string()
   |> IO.puts()

end

def read_str(), do: IO.read(:line) |> String.trim()


def process() do
   read_str() |>
      String.trim |> Solution.check()
end

end

Solution.process()

