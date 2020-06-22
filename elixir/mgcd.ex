defmodule Solution do



    def split_test(list) do
    #  IO.inspect list
      g1 = hd list
      g2 = hd tl list
      get_value(g1, g2)

    end

    def calc_gcd(n, d, 0) do
      d
    end

    def calc_gcd(n,d, r ) do
        if rem(n,d) == 0 do
          calc_gcd(n, d, 0)
        else
          calc_gcd(d, rem(n, d), 1 )
        end

    end

    def get_value(g1, g2) when (g1==g2) do
      g1
    end

    def get_value(g1, g2) when (g1>g2) do
      calc_gcd(g1, g2, 1)
    end

    def get_value(g1, g2) when (g2>g1) do
      calc_gcd(g2, g1, 1)
    end

    def test_data() do

    IO.read(:line)
       |> String.trim()
       |> String.split()
      # |> String.to_integer
        |> Enum.map(&String.to_integer/1)
        |> split_test()
      # |> Enum.map(&String.to_integer/1)
        |> IO.inspect

    end

    def valid_fn do

      test_data()
    end

end



Solution.valid_fn
