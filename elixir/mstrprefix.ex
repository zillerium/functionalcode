defmodule Solution do
  def read_str do
    IO.read(:line)
    |> String.trim()
  end

 # public interface, take first char and remember it as the current value
  def encode(<<char::utf8, rest::binary>>, <<char1::utf8, rest1::binary>>) do
    s = <<char::utf8>>
    IO.puts "initial #{s}"
    do_encode1(rest, rest1, <<char::utf8>>,  <<char1::utf8>>, 1)
  end

  def stop() do

  end


  # shared prefix
  def do_encode1(<<char::utf8, rest::binary>>, <<char::utf8, rest1::binary>>, prefix, prefix, count) do
    if count > 10 do stop() end
   # IO.puts "prefix #{<<prefix::utf8>>}"
   # IO.puts "char #{<<char::utf8>>}"

   # np = <<prefix::utf8>> <> <<prefix::utf8>>
   # IO.puts "#{np}"
   # npp = <<np::utf8>>
    do_encode2( rest, rest1, prefix, prefix, count )
  end

  def do_encode2( <<char::utf8, rest::binary>>, <<char::utf8, rest1::binary>>, prefix, prefix, count ) do
    IO.puts "#{count} #{prefix} #{char}"
    if count > 10 do
      stop()
      IO.puts("if stmts")
    else
      np1 = prefix  <> <<char::utf8>>
      IO.puts "#{np1}"
      np = prefix

      do_encode3( rest, rest1, np1, np1, count+1)
    end
  end
  def do_encode3( <<char::utf8, rest::binary>>, <<char1::utf8, rest1::binary>>, prefix, prefix, count ) do


  end


  # chars unmatched for prefix
  def do_encode2( <<char::utf8, rest::binary>>, <<char1::utf8, rest1::binary>>, prefix, prefix, count ) do
    IO.puts "#{count} #{prefix} #{char}"
    if count > 10 do
      stop()
      IO.puts("if matched stmts")
    else
      np1 = prefix  <> <<char::utf8>>
      IO.puts "#{np1}"


      do_encode2(rest, rest1, np1, np1, count+1)
    end
  end


  def main() do
    str1 = read_str()
    str2 = read_str()
    encode(str1, str2)


  end

end

Solution.main()


