defmodule Demo do
  def run do
    try do
      Keyword.fetch!([a: 6], :a)
    rescue
     # e in KeyError -> e
      KeyError -> "key not found"
      ArgumentError -> "..."
    after # always runs
      IO.puts "always executed"
    else # no errors
      5 -> "found five"
      _ -> "not sure"
    end
  end
end

Demo.run |> IO.inspect
