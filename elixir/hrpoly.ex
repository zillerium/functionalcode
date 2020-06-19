defmodule Solution do

  def get_int do
    IO.read(:line)
    |> String.trim()
    |> String.to_integer

  end

  def get_len(org, head, [], _, tot) do
    cx =[ head] ++ [org]
    #IO.inspect cx

    tot+ get_len_calc(cx)
  end

  def get_len(_, _, _, 0) do

  end

  def get_len1(org, head, tail, count) do

    uu = hd tail
    IO.inspect head
    IO.inspect tail
    IO.inspect uu

   end

   def get_len_calc(list) do
    coords = List.flatten(list)
    x1=String.to_integer(hd coords)
    y1 = String.to_integer(hd tl coords)
    x2 = String.to_integer(hd tl tl coords)
    y2=String.to_integer(hd tl tl tl coords)

    tot = ((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1))

   # IO.inspect x1
   # IO.inspect x2
   # IO.inspect y1
   # IO.inspect y2
    toto = :math.sqrt(tot)
    toto
   end

  def get_len(org, head, tail, count, tot) do



    cx =[ head] ++ [hd tail]


    get_len(org, (hd tail), (tl tail), (count-1), tot+ get_len_calc(cx))
   end

  def calc(list, count)
   do

    #IO.inspect list
    x = hd list
    y = tl list

    get_len(x, x, y, (count-1), 0)
   # IO.inspect c1
   # IO.inspect c2
   # IO.inspect c3
   # IO.inspect c4
   ## calc([[hd list] | [hd tl list]])
  end

  def test_data do
     1..get_int()
    |>  Enum.map(fn _ -> IO.read(:line) end)
     |> Enum.map(&String.split/1)
     |> calc(6)
      |> IO.inspect
    #|> Enum.each(fn x -> calcLen(x) end)
    #|> IO.inspect
    # |> check_dups
  end

  def valid_fn do

    test_data()
   # |> IO.inspect
   # |> Enum.map(&dup_check/1)
   # |> Enum.each(&IO.puts/1)
  end

end


Solution.valid_fn
