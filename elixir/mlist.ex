defmodule Demo do
  def delete do
    List.delete_at list(), 2
  end
def flatten do
  lists = [list(), [1,2,3], [4,5,6]]
  ##List.flatten(lists)
  #List.Chars
  lists
end

def reduce do
  list() |> Enum.reduce(0, &(&1 + &2))
end

def map do
  list() |> Enum.map(&(&1 * 2))
end

def each do
  list() |> Enum.each(&IO.puts/1)

end

def all do
  list() |> Enum.all?(&Kernel.is_integer/1)
end

def insert do
  List.insert_at(list(), 100, "new door")
end
  def list do

    [1,2,3,4,5,6]
  end

def max do
  list() |> Enum.max
end

end

Demo.max() |> IO.inspect
