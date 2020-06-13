defmodule Demo do
  def run(str) do
    len = String.length(str)
    cond do
      len > 0 && len < 5 -> "short"
      len > 4 && len < 10 -> "long"
      len > 9 -> "very long"
      true -> "empty"
    end
  end
end

Demo.run("") |> IO.inspect
