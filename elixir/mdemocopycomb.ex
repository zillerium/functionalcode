defmodule Solution do
use Agent

  def read_int do
  ##  IO.puts "reading data"
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def start do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: __MODULE__)
  end

  def read_nk() do

    IO.read(:line) |> String.trim() |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def get_a(old_a, new_a) do


  end

  def sel_player([], _t, _n, _k, map, _a, [], _ts, _tn,[], _m) do
    IO.puts "//////////// -- "
    map
  end

  def sel_player([], _t, _n, _k, map, _a, [], _ts, _tn, _p, []) do
    IO.puts "//////////// -- "
     map
  end

  def sel_player([], _t, _n, _k, map, _a, [], _ts, _tn, [], []) do
    IO.puts "//////////// -- "
      map
  end

  def create_anchor(p, 0, a) do
    a
  end

  def create_anchor(p, k, a) do
    a=a++[hd p]

    create_anchor((tl p), k - 1, a)
  end

  def sel_player([], t, n, k, map, a, [], ts, tn, p, m) do
    IO.puts "@@@@@@@@@@@@@ -- "
    print_val([], t, n, k, map, a, [], ts, tn, p, m)

    read_int()
    #map=Map.put(map, tn, t)
    # remove last anchor point
    # take next element after anchor point in pop list
    # repeat until end of pop list then


    new_a = create_anchor(p, k)
    rem = tl m

    sel_player(rem, new_a, n, k, map, new_a, rem, k-1, tn , (tl p), (tl m) )
  end
#

  def sel_player([], t, n, k, map, a, rem, ts, tn, p, m) do
    IO.puts "------- [] "
    print_val([], t, n, k, map, a, rem, ts, tn, p, m)

    read_int()
    map=Map.put(map, tn, t)
    # remove last anchor point
    # take next element after anchor point in pop list
    # repeat until end of pop list then

    new_a = Enum.reverse(a) |> tl() |> Enum.reverse()

    [h|t]=rem
    new_a = new_a ++ [h]

    sel_player((tl rem), new_a, n, k, map, new_a, (tl rem), k-1, tn + 1, p, m )
  end
#  def sel_player([], y, n, k, map, a, rem,ts, tn) do
#    IO.puts "=========nnnnnnn=========="
#  end
 # def sel_player(x, y, n, k, map, a, rem, ts, tn) do
 #   IO.puts "==================="
 # end
 def sel_player(x, t, n, k, map, a, rem, ts, tn, p, m)
 when ts >= k and length(x) == 1 do
  IO.puts "++++ ts >=k and length == 1"
  print_val(x, t, n, k, map, a, rem, ts, tn, p, m)

   read_int()
  [n_hd|n_tl]=x
   map=Map.put(map, tn, t)


   sel_player([], a ++ [n_hd] , n, k, map, a, rem, ts, tn + 1, p, m )
end

def print_val(x, t, n, k, map, a, rem, ts, tn, p, m) do

  IO.inspect(x, label:   " x")
  IO.inspect(t, label: " t")
  IO.inspect(n, label: " n")
  IO.inspect(k, label: " k")
  IO.inspect(map, label: " map")
  IO.inspect(a, label: " a")
  IO.inspect(rem, label: " rem")
  IO.inspect(ts, label: " ts")
  IO.inspect(tn, label: " tn")
  IO.inspect(p, label: " p")
  IO.inspect(m, label: " m")
end

  def sel_player(x, t, n, k, map, a, rem, ts, tn, p, m)
    when ts >= k do

    IO.puts "++++===== ts >=k and length != 1"
    print_val(x, t, n, k, map, a, rem, ts, tn, p, m)

    [n_hd|n_tl]=x
    read_int()
    map=Map.put(map, tn, t)


    sel_player(n_tl, a ++ [n_hd] , n, k, map, a, rem, ts, tn + 1, p, m )
  end

  def sel_player(x, t, n, k, map, a, rem, ts, tn, p, m )
      when ts < k do
    IO.puts "++++??? ts <k "
    print_val(x, t, n, k, map, a, rem, ts, tn, p, m)

    [n_hd|n_tl]= x
    read_int()

    sel_player(n_tl, t++[n_hd], n, k, map, a, rem, ts + 1, tn, p, m )
  end

  def process_check(0) do

  end



  def process_check(count) do
    [n, k] = read_nk()
    mod1 = trunc(:math.pow(10, 8) + 7)

    pop=Enum.to_list(1..n)
    rem=Enum.to_list(k..n)
    team=Enum.to_list(1..k)
    anchor=Enum.to_list(1..(k-1))
    map=%{}

    new_map = sel_player(rem, anchor, n, k, map, anchor, rem, k-1, 1, (tl pop), rem)

    new_map |> Enum.each(fn n -> IO.inspect n end)

    #Enum.each(fn x -> IO.write "#{x} " end) end)


    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)
  end

end
{:ok, _} = Solution.start
Solution.check()
