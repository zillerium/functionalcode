defmodule Demo do
  def work(n, i) do
    pid = spawn fn ->
      :timer.sleep(5000)
      IO.puts("#{i} - result is #{:rand.normal() * n}")
    end
    pid |> IO.inspect
  end

  def run(n) do
    #spawn fn ->
      Enum.each 1..5, &(work(n, &1))
    #end
  end
end

#pid = Demo.run(6)
Demo.run(5)
#pid = spawn Demo, :run, []
#pid |> IO.inspect

IO.puts "other work"
