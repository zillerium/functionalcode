defmodule Solution do
    def fib(n,m) do
        case Map.fetch(m, n) do
            {:ok, _} ->
            m
            :error ->
            m = fib(n-1,m)
            m = fib(n-2,m)
            n1 = Map.fetch!(m,n-1)
            n2 = Map.fetch!(m,n-2)
            Map.put(m, n, rem(n1+n2, 100000007))
        end
    end

    def do_fib(0,_), do: nil

    def do_fib(t,m) do
        {n,_} = IO.read(:stdio, :line) |> Integer.parse
        m = fib(n,m)
        IO.puts Map.fetch!(m, n)
        do_fib(t-1,m);
    end

end

{t, _} = IO.read(:stdio, :line) |> Integer.parse
Solution.do_fib(t,%{0 => 0, 1 => 1})
