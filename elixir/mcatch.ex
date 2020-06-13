defmodule Demo do
  def run do
    try do
      throw "val1"
    catch
      "val" -> "found error"
      _ -> "unsure of value"
    end
  end
end

Demo.run |> IO.inspect
