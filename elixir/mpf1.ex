defmodule PrimeFactors do


  def read_int do
    ##  IO.puts "reading data"
      IO.read(:line) |> String.trim() |> String.to_integer()
    end

  def start do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: __MODULE__)
  end


  def check_prime(n) do
    IO.inspect(n, label: "checking n")
    cached_value = Agent.get(__MODULE__, &(Map.get(&1, n)))
    if cached_value do
      IO.inspect "test 1"
      cached_value
    else
      IO.inspect "test 2"
      v = !isfactor(n, n-1, false)
      Agent.update(__MODULE__, &(Map.put(&1, n, v)))
      v
    end
  end

  def valid_num(n) do
    cond do
      !has_zero(n) and check_prime(n) -> true
      true -> false
    end
  end

  def get_size(n) do
    trunc(:math.log10(n)+1)
  end

  def has_zero(n) when n < 10 do
    false
  end

  def has_zero(n) when rem(n,10) == 0 do
    true
  end

  def has_zero(n)   do
    has_zero(trunc(n/10))
  end

  def get_factors(n, s) do
    f=:math.pow(10,s)
    factor = trunc(n/f)
  end

  def isfactor(_n, _i, factor) when factor == true do
     true
  end

  def isfactor(_n, 1, factor),   do: false

 def findprime(n) do
    if check_prime(n) do
      IO.inspect "prime"
    else
      IO.inspect "not a prime"
    end
 end

 def isfactor(0,_, _factor)   do
  true
 end

 def isfactor(1,_, _factor)   do
  true
 end

 def isfactor(2,_, _factor)   do
  false
 end

 def isfactor(n,i, factor) when rem(n,2) == 0   do
  true
 end

 def isfactor(n,i, factor) when rem(i,2) == 0   do
  isfactor(n, i - 1, false)
 end

 def isfactor(n,i, factor) when factor == false   do
  IO.inspect i
    isfactor(n, i - 2, rem(n, i) == 0)
  end

  def left_prime(s, n, valid) when s < 1 do
    true
  end

  def left_prime(s, n, valid) when valid==false do
    IO.inspect "not prime found"
    false
  end

  # 2100-trunc(2100/1000)*1000

  def left_prime(s, n, valid) when valid==true do
      IO.inspect(n, label: "n")
      IO.inspect(s, label: "s")
      p = :math.pow(10,s - 1)
      t = trunc(n - (n - (r * p)))
      IO.inspect(t, label: "t")
      if check_prime(t) do
        IO.inspect "prime found"
        left_prime(s - 1, t, true)
      else
        IO.inspect "==== not prime found"
        left_prime(s, n, false)
      end

  end

  def right_prime(s, 0, valid, f)  do
    true
  end

  def right_prime(s, n, valid, f) when valid==false do
    false
  end

  def right_prime(s, n, valid, f) do
    ##p = trunc(:math.pow(10,f)
    p = 10
    l = rem(n, p)

      if check_prime(l) do
        right_prime(s, l, true, f )
      else
        right_prime(s, n, false, f)
      end
  end

  def check_num(n) do
    s= get_size(n)
    lp = left_prime(s, n, true)
    IO.inspect(lp, label: "label: lp")
    rp = right_prime(s, n, true, 1)
    IO.inspect(rp, label: "label: rp")
    cond do
      lp and rp -> IO.puts "CENTRAL"
      lp and !rp -> IO.puts "RIGHT"
      !lp and rp -> IO.puts "LEFT"
      true -> IO.puts "DEAD"
    end
  end

  def process(0) do

  end

  def process(count) do
    n = read_int()


    if valid_num(n) do
      check_num(n)
    else
      IO.puts "DEAD"
    end

    process(count-1)
  end

  def main() do
     tcase=read_int()
     process(tcase)
  end

end

{:ok, _} = PrimeFactors.start
 PrimeFactors.main()
