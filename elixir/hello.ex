defmodule M do
  def main do
    name = IO.gets("enter name") |> String.trim
    IO.puts "hello #{name}"
  end 
end
