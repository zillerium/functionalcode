defmodule Solution do
  def read_str do
    IO.read(:line)
    |> String.trim()
  end

  def read_int, do: IO.read(:line) |> String.trim() |> String.to_integer()

  def count_colors([], ball_map, red_pre, yellow_pre) when red_pre <=1 and yellow_pre <= 1 do
    ball_map
 end

 def count_colors([], ball_map, red_pre, yellow_pre) when red_pre > 1 or yellow_pre > 1 do
  IO.puts "False"
  bmap = Map.update(ball_map, "F", Map.fetch(ball_map, "F"), &(&1 +1))
  bmap
end

def count_colors([ball|rest_balls], ball_map, red_pre, yellow_pre) when red_pre > 1 or yellow_pre > 1 do

  IO.puts "False"
  bmap = Map.update(ball_map, "F", Map.fetch(ball_map, "F"), &(&1 +1))
  bmap
end

  def count_colors([ball|rest_balls], ball_map, red_pre, yellow_pre) when red_pre <=1 and yellow_pre <= 1 do

     bmap = Map.update(ball_map, ball, Map.fetch(ball_map, ball), &(&1 +1))
       {_, r}= Map.fetch(bmap, "R")
    {_, g}=Map.fetch(bmap, "G")
    {_, y}= Map.fetch(bmap, "Y")
    {_, b}=Map.fetch(bmap, "B")
#IO.puts "red #{r} blue #{b} green #{g} yellow #{y} diff #{abs(y - b)} pre1 #{red_pre} pre2 #{yellow_pre}}"
     count_colors(rest_balls, bmap, abs(r - g), abs(y - b))

  end



  def test_colors(updated_map) do

    {_, r}= Map.fetch(updated_map, "R")
    {_, g}=Map.fetch(updated_map, "G")
    {_, y}= Map.fetch(updated_map, "Y")
    {_, b}=Map.fetch(updated_map, "B")

    if (r - g) != 0 or (y - b) !=0 do
      IO.puts "False"
    else
      IO.puts "True"
    end


  end

  def read_colored_balls() do
    balls = read_str()
    ball_list = String.codepoints(balls)
    ball_map=%{"R" => 0, "G" => 0, "Y" => 0, "B" => 0,  "F" => 0}
    updated_map = count_colors(ball_list, ball_map, 0, 0)

     {_, f}=Map.fetch(updated_map, "F")

    if (f == 1) do

    else
      test_colors(updated_map)
    end

    #IO.inspect updated_map



  end

  def main() do
    1..read_int()
 |> Enum.map(fn _ -> read_colored_balls() end)
 #|> IO.inspect

  end

end

Solution.main()


