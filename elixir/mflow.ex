defmodule App do
  def run do
    :ets.new(:words, [{:write_concurrency, true}, :named_table, :public])
    space = :binary.compile_pattern([" ", "\n"])

    IO.binstream(:stdio, :line)
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, space))
    |> Flow.each(fn word ->
      :ets.update_counter(:words, word, {2, 1}, {word, 0})
    end)
    |> Flow.run()

    :ets.match_object(:words, {:"$0", :"$1"})
    |> Enum.sort(fn {_, a}, {_, b} -> b < a end)
    |> Enum.map(fn {word, count} ->
      [String.pad_leading(Integer.to_string(count), 8), " ", word, "\n"]
    end)
    |> IO.puts
  end
end

IO.puts(:stderr, elem(:timer.tc(&Aapp.run/0), 0))
