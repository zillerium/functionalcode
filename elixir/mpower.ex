defmodule Solution do

  def read_int() do
    IO.read(:line)
    |> String.trim()
    |> String.to_integer
  end

  def nth_root(n, x, precision \\ 1.0e-5) do
    f = fn(prev) -> ((n - 1) * prev + x / :math.pow(prev, (n-1))) / n end
    fixed_point(f, x, precision, f.(x))
  end

  defp fixed_point(_, guess, tolerance, next) when abs(guess - next) < tolerance, do: next
  defp fixed_point(f, _, tolerance, next), do: fixed_point(f, next, tolerance, f.(next))

  def count_pow(x, n, seq, tot, count) when tot < x do
    IO.puts("seq #{seq} #{tot}")
    p = :math.pow(seq, n)
    count_pow(x, n, seq + 1, p + tot, count)
  end

  def count_pow(x, n, seq, tot, count) when tot == x do
    IO.puts "matched"
     count + 1

  end

  def count_pow(x, n, seq, tot, count) when tot > x do
    IO.puts "too big #{tot}"
    count

  end

  def man_pow(x, n, seq, tot, count, max) when seq > max do
    count
  end

  def man_pow(x, n, seq, tot, count, max) when seq <= max do
    s = count_pow(x, n, 1, tot, count)
    IO.puts("man sum #{seq} #{s}")
    man_pow(x, n, seq+1, tot, s, max)

  end


  def sum_pow(x, n, seq, tot, count, max) when seq > max do
    count
  end

  def sum_pow(x, n, seq, tot, count, max) when seq <= max do
    s = man_pow(x, n, seq, tot, count, max)
    IO.puts("seq sum #{seq} #{s}")
    sum_pow(x, n, seq+1, tot, s, max)

  end

  def get_sum_powers(_bound, _power, rem, list, _init_int, _anchor) when rem == 0 do
    IO.puts "matched===="
    list

  end

  def get_sum_powers(bound, power, rem, list, init_int, anchor) when anchor < 1 do
    new_bnd = bound - :math.pow(init_int, power)
    IO.puts "power - #{power} newbound - #{new_bnd} anchor - #{anchor} rem = #{rem}"
    root_val = get_nth_root(power, new_bnd)
    new_anchor=trunc(root_val)

    sum_powers(new_bnd, power, new_bnd,  new_anchor, new_anchor )
  end

  def get_sum_powers(_bound, _power, _rem, _list, init_int, _anchor) when init_int <= 1 do

  end

  def get_nth_root(power, a_number) when a_number < 0 do
    0
  end

  def get_nth_root(power, a_number) when a_number == 0 do
    0
  end

  def get_nth_root(power, a_number) when a_number > 0 do
    nth_root(power, a_number)
  end


  def get_sum_powers(bound, power, rem, list, init_int, anchor) do

    IO.puts "anchor = #{anchor} init int = #{init_int} bound = #{bound} rem - #{rem}"
    power_tot = :math.pow(anchor, power)
    nrem = trunc(rem - power_tot)
    root_val = get_nth_root(power, nrem)
    new_anchor=trunc(root_val)
    debug = read_int()
    if anchor==new_anchor do
      get_sum_powers(bound, power, rem, list, init_int, anchor - 1)
    end

    IO.puts "new_anchor = #{new_anchor} init int = #{init_int} bound = #{bound} nrem - #{nrem}"
    get_sum_powers(bound, power, nrem, (list ++ [anchor]), init_int, new_anchor)
  end

  def sum_powers(bound, power, bound, init_int, anchor) when init_int ==0 do


  end

  def sum_powers(bound, power, rem, init_int, anchor) do
    IO.puts "manager anchor = #{anchor} init int = #{init_int} bound = #{bound} "

    list = get_sum_powers(bound, power, rem,[], init_int, anchor)

    IO.inspect list
    debug = read_int()

    power_tot = :math.pow((init_int - 1), power)
    rem = trunc(bound - power_tot)
    root_val = get_nth_root(power, rem)
    new_anchor=trunc(root_val)

    IO.puts "manager anchor 2 = #{bound} init int = #{init_int} rem = #{rem} "

    sum_powers(bound, power, rem, init_int - 1, new_anchor)
  end

  def main() do
     upper_bound = read_int()
     power = read_int()
     init_val=get_nth_root(power, upper_bound)
     init_int=trunc(init_val)
     IO.puts("#{init_int}")
     list=sum_powers(upper_bound, power, upper_bound, init_int, init_int)
    ## r =sum_pow(x, n, 1, 0, 0, k)
    ## IO.puts("#{r}")
   ##  count_pow(x,n, 1, 0)

  end

end

Solution.main()
