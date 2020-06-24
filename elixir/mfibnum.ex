defmodule Solution do
  ##use Memoizer
  def read_int do
  ##  IO.puts "reading data"
    IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def fib(0, acc) do
    {0, acc}
  end

  def fib(1, acc) do
    {1, acc}
  end

  def fib(n, acc) do


##d=read_int()
    x = trunc(:math.pow(10, 8) + 7)
    #rem(rem(fib(n-1), x) + rem(fib(n-2), x), x)
IO.puts "n = #{n} "
IO.inspect acc
##IO.inspect acc
##    g=read_int()

    if acc[n] do
      IO.puts "matched ===================="
      { acc[n], acc }
    else
      {_n1, acc2} =  fib(n-1, acc)
      {_n2, acc1} =  fib(n-2, acc)

      _n1x = rem(_n1, x)
      _n2x = rem(_n2, x)
      value = rem(_n1x+_n2x, x)
     # IO.inspect acc
     # IO.puts "n = #{n}"
     # IO.puts "value = #{value}"
      y = Map.put(acc2, n, value)
     # IO.puts "updated "
     IO.inspect y
     # { value, y}
     {value, Map.merge(acc1, y)}
    end

   ## { Map.get(acc, n, acc)}

   # rem(rem(10, x) + rem(fib(n-2), x), x)
  end

##fun = memoization.(& &1 * 2)

  memoization = fn fun ->
    fn n, acc ->
      acc =
        if(!acc[n]) do
          Process.sleep(1_000)
          IO.inspect acc, label: "Just put... Need a rest... Sleeping... Zzzz..."
          Map.put(acc, n, fun.(n))
        else
          acc
        end
      {acc, Map.get(acc, n)}
    end
  end


  def process_check(0), do: 1

  def process_check(count) do
    n = read_int()
    {t, _t} = fib(n, %{})
    ##{}
    IO.inspect t
    IO.puts "total = #{t}"
    process_check(count - 1)
  end

  def check() do
    test_cases = read_int()
    process_check(test_cases)
  end

end



#fun = memoization.(& &1 * 2)
#{acc, _} = IO.inspect fun.(42, %{}), label: "Result for 42"
#{acc, _} = IO.inspect fun.(42, acc), label: "Result for 42"
#{acc, _} = IO.inspect fun.(3.14, acc), label: "Result for 3.14"
#{_, _} = IO.inspect fun.(3.14, acc), label: "Result for 3.14"


Solution.check()
