defmodule Solution do
  def read_str do
    IO.read(:line)
    |> String.trim()
  end

 # public interface, take first char and remember it as the current value
  def encode(<<char::utf8, rest::binary>>, <<char1::utf8, rest1::binary>>) do
   ## IO.puts "#{char} #{char1} #{<<char::utf8>>} #{<<char1::utf8>>}"
    do_encodex(rest, rest1, <<char::utf8>>, <<char1::utf8>>, 1)
  end

  defp do_encodex("","", pr, _, count) do
    IO.puts "#{count} #{pr}"
    s1= ""
    s2= ""
    l1=0
    l2=0
    IO.puts "#{l1} #{s1}"
    IO.puts "#{l2} #{s2}"
  end

  defp do_encodex(<<char::utf8, rest::binary>>,"", pr, _, count) do
    IO.puts "#{count} #{pr}"
    s1= <<char::utf8, rest::binary>>
    s2= ""
    l1=String.length(s1)
    l2=0
    IO.puts "#{l1} #{s1}"
    IO.puts "#{l2} #{s2}"
  end

  defp do_encodex("",<<char::utf8, rest::binary>>, pr, _, count) do
    IO.puts "#{count} #{pr}"
    s1= ""
    s2= <<char::utf8, rest::binary>>
    l1=0
    l2=String.length(s2)
    IO.puts "#{l1} #{s1}"
    IO.puts "#{l2} #{s2}"
  end



  #end
  defp do_encodex(<<char::utf8, rest::binary>>, <<char1::utf8, rest1::binary>>, pr, pr, count) when char != char1 do
   # IO.puts "count end ===="
   # IO.puts "#{char}  #{<<char::utf8>>} "
   # IO.puts "#{char1}  #{<<char1::utf8>>} "
   # IO.puts "#{pr} "
    np = pr <> <<char::utf8>>

   # IO.puts "#{np} #{np}"
   # IO.puts "count end ===="
    IO.puts "#{count} #{pr}"
    s1= <<char::utf8, rest::binary>>
    s2= <<char1::utf8, rest1::binary>>
    l1=String.length(s1)
    l2=String.length(s2)
    IO.puts "#{l1} #{s1}"
    IO.puts "#{l2} #{s2}"

    #IO.puts "#{s}"
    if count > 10 do
    else
      #do_encodex(rest, rest1, pr, pr1, count + 1)
    end
    #do_encode(rest, char, count + 1, acc)
  end

  defp do_encodex(<<char::utf8, rest::binary>>, <<char::utf8, rest1::binary>>, pr, pr, count) do
   # IO.puts "count ===="
   # IO.puts "#{char}  #{<<char::utf8>>} "
   # IO.puts "#{pr} "
    np = pr <> <<char::utf8>>

   # IO.puts "#{np} #{np}"
   # IO.puts "count ===="

      do_encodex(rest, rest1, np, np, count + 1)

    #do_encode(rest, char, count + 1, acc)
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
    str1 = read_str()
    str2 = read_str()
    encode(str1, str2)

  end

end

Solution.main()


