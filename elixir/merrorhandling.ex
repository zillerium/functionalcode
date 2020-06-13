defmodule Demo do
  defexception [:message "error from demo"]
  def run do
    #raise "error"
    #raise ArgumentError, message: "error in mod"
    raise Demo
  end
end

Demo.run |> IO.inspect
