defmodule M do
  def main do
    getInt()
    getList()
    getAtom()
  end

  def getInt do
    intVal = 44
    IO.puts "enter value #{is_integer(intVal)}"
  end

  def getList do
    list1 = [1,2,3]
    list2 = [4,5,6]
    list3 = list1 ++ list2
    [head|tail] = list3
    IO.puts "Head : #{head}"

    Enum.each tail, fn item ->
      IO.puts item
    end  

    display_list(tail)

  end 

  def display_list([item|tail]) do
    IO.puts item
    display_list(tail)
  end

  def display_list([]), do: nil


  def getAtom do
    IO.puts "Atom #{is_atom(:London)}"
    mystr = "This is a test string"
    IO.puts "Length: #{String.length(mystr)}"
    longstr = mystr <> " " <> " my new ending"
    IO.puts "Equal : #{"Egg" === "egg"}"
    IO.puts "My ? #{String.contains?(mystr, "test")}"
    IO.puts "First : #{String.first(mystr)}"
    IO.puts "Index 4 : #{String.at(mystr, 4)}"
    IO.puts "Substring : #{String.slice(mystr, 3,8)}"
    IO.inspect String.split(longstr, " ")
    IO.puts String.reverse(longstr)
    IO.puts String.upcase(longstr)
    4 * 10 |> IO.puts
    IO.puts " 4 == 4.0 : #{4 == 4.0}"
    IO.puts " 4 === 4.0 : #{4 === 4.0}"

    age = 67

    cond do
      age > 60 -> IO.puts "get pension"
      age < 60 -> IO.puts "work now"
      true -> IO.puts "claim now"
    end


    case age do
      67 -> "claim now"
      _  -> "default claim"
    end

    mystats = {200, 5.99, :Hello}
    IO.puts "Tuple #{is_tuple(mystats)}"

    mystats2 = Tuple.append(mystats, 999)

    IO.puts "Age #{elem(mystats, 0)}"

    


  end 
end
