defmodule Solution do


    def fact(0) do
      1
    end

    def fact(n) when n < 0 do
      1
    end

    def fact(n) when n > 0 do
      n*fact(n-1)
    end


    def row_entry(n, r, limit) when r > n do

    end

    def row_entry(n, r, limit) when r == n do
      if (n>11) do stop() end
     ## IO.write " row entry limit #{n} #{r} #{limit} "
       x = fact(n) / (fact(r) * fact(n-r))
       IO.puts "#{trunc(x)}"
       row_entry(n, r+1, limit)

    end

    def row_entry(n, r, limit) when r < n do
      if (n>11) do stop() end

     ## IO.write " row entry #{n} #{r} #{limit} "
       x = fact(n) / (fact(r) * fact(n-r))
       IO.write "#{trunc(x)} "
       row_entry(n, r+1, limit)

    end



    def stop() do
      IO.puts "too many outputs"
    end

    def print_triangle(n, limit) when n >= limit do

    end

    def print_triangle(n, limit) when n < limit do
      if (n>11) do stop() end
      row_entry(n,0, limit)
      print_triangle(n+1, limit)
    end

    def read_int() do
      IO.read(:line)
      |> String.trim()
      |> String.to_integer
    end

    def solve() do
      v = read_int
     ## IO.puts "v #{v}"
      Solution.print_triangle(0, v)

    end

end

Solution.solve()
