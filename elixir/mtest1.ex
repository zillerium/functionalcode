defmodule Solution do

def main(x) do
IO.inspect test(x)
end

def test(x) do
  cond do
     x==10 -> "equals 10"
     x>10 -> "less than 10"
  end
end

end

Solution.main(10)
