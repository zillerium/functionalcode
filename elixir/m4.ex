defmodule Myread do

 #  printd

  def readdata([]) do
 {age, _} = IO.gets("enter age: ") |> Integer.parse
    readdata([age])
  end

  def readdata (a) do
#  n=  IO.read(:stdio, :line)
{age, _} = IO.gets("enter age: ") |> Integer.parse   
# IO.puts :line
   # n =  IO.getso ""
   b =    [age | a]
  # b = [age] ++ a
   IO.inspect b
   readdata(b)
  end
  
  def printd do 
    IO.puts "testing"
  end 
end
