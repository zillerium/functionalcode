defmodule Demo do
  def run do
    try do
      exit :very_bad
    catch
      ##_ -> "end"
      :exit, :very_bad -> "custom error"
      :exit, _ -> "more errors"
    end
  end
end

Demo.run |> IO.inspect
