defmodule Demo do
  def run do
    val = 5
    if val == 5, do: "positive\n", else: "negative\n"
    if val == 5 do
      "second cond if\n"
    else
      "second cond else\n"
    end
   # unless val == 5 do
    #  "third cond if\n"
    #else
    #  "third cond else\n"
    #end
  end
end

Demo.run |> IO.inspect
