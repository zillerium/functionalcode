defmodule MyApp do
  #import IO
  #alias IO, as: DemoIO
  def add(a, b) do
    a + b
  end
  # def plus(a, b), do: a + b
  def factorial (0) do
    1
  end

  def factorial(a) when is_integer(a) and a > 0 do
     a * factorial(a-1)
  end
  def mult(a, b) do
    printd()
      IO.puts("private string2") 
    a * b
  end

  def factorial(_) do
    {:error, :invalid_argument}
  end

  defp printd do
    # private
    [1,2,3] |> length |> IO.puts
  end 

  #def add(a, b \\0) do
    # a+b
  #end
  def calc(a) do
    add a,0
  end
  def calc(a,b) do
     a+b
  end
  def divide(_a, 0) do
    {:error, :zero_division}
  end
  def divide(a, b) do
    a / b
  end  
end
