defmodule Solution do
  def read_str do
    IO.read(:line)
    |> String.trim()
  end

 # public interface, take first char and remember it as the current value
  def encode(<<char::utf8, rest::binary>>) do
    do_encode(rest, char, 1, "")
  end

  # current == last, increase the count and proceed
  defp do_encode(<<char::utf8, rest::binary>>, char, count, acc) do
    do_encode(rest, char, count + 1, acc)
  end

  defp do_encode(<<char::utf8, rest::binary>>, last, count, acc) when count==1 do
    do_encode(rest, char, 1, acc <>  <<last::utf8>>)
  end

  # current != last, reset count, encode previous values and proceed
  defp do_encode(<<char::utf8, rest::binary>>, last, count, acc) do
    do_encode(rest, char, 1, acc <>  <<last::utf8>> <> to_string(count))
  end

  defp do_encode("", last, count, acc) when count == 1do
    acc <>  <<last::utf8>>
  end

  # input empty, encode final values and return
  defp do_encode("", last, count, acc) do
    acc <>  <<last::utf8>> <> to_string(count)
  end

  def main() do
    str = read_str()
    x=encode(str)
    IO.puts "#{x}"

  end

end

Solution.main()


