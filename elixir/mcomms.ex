defmodule Demo do
  def work do
    IO.puts "doing work .."
    #receive do
      #message -> IO.puts message
    #end
    result = receive do
      {sender, {a,b}} -> send(sender, a * b)
      #message -> message
      after 5000 -> IO.puts "enough" #timeout
    end
    IO.puts result
  end

  def run(message) do
    pid = spawn fn ->
      work()
    end
    send pid, {self(), message} #self

    receive do
     response -> IO.puts "response #{response}"
        # code
    end

  end
end

#Demo.run("new message")
Demo.run({2, 3})
