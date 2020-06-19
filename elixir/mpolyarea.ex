defmodule Solution do
  def get_int do
    IO.read(:line)
    |> String.trim()
    |> String.to_integer


  end
  #
  def stop, do: 10

  def calc_area([],list), do: 0

  def calc_area(_rest1,list) do
    [[x1, y1]|rest]=list
    [x2, y2] = hd rest
    dist = (x1*y2 - y1*x2)
  ##  IO.puts "x1 - #{x1} #{y1} #{x2} #{y2} #{dist}"
    dist
  end

  def solve(list, acc\\0, count\\0)

  def solve(list, acc, count) when length(list)==0 do
      abs(acc)/2
  end

  def solve1([first|rest]) do
      solve([first]++rest++[first],  0, 1)
  end

  def solve(list, acc, count) do

     ## IO.inspect list
      rest = tl list
      dist = calc_area(rest, list)
    ##  IO.puts "tot -   #{acc} #{dist}"
      if count>10 do stop end
      solve(rest, acc+dist, count+1)
    end

    def test_data() do

      1..get_int()
      |>  Enum.map(fn _ -> IO.read(:line) end)
       |> Enum.map(&String.split/1)
       |> Enum.map( fn [l, r] -> [l,r] |> Enum.map(&String.to_integer/1) end)
       |> solve1
      # |> Enum.map(&String.to_integer/1)
        |> IO.puts

    end

    def valid_fn do

      test_data()
    end

end



Solution.valid_fn
