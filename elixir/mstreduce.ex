defmodule Solution do

  def read_str do
    IO.read(:line)
    |> String.trim()
  end

  def reduce(str) do
    list = String.codepoints(str)
    ulist = Enum.uniq(list)
    n=List.to_string(ulist)
    IO.puts "#{n}"
  end

  def main() do
    str1 = read_str()

    reduce(str1)

  end

end

Solution.main()

