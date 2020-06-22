defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
  def read(str) do
    convert(String.codepoints(str), "", "", 0) |> IO.puts
  end

  defp convert([], converted, char, count) do
    if(count > 1) do
      converted <> "#{char}#{count}"
    else
      converted <> "#{char}"
    end
  end
  defp convert([h | rest], converted, char, count) do
    if(h != char) do
      if(count > 1) do
        convert(rest, converted <> "#{char}#{count}", h, 1)
      else
        convert(rest, converted <> "#{char}", h, 1)
      end
    else
      convert(rest, converted, h, count + 1)
    end
  end
end

IO.gets("") |> String.trim |> Solution.read
