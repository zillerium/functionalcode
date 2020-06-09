defmodule Solution do
    #Enter your code here. Read input from STDIN. Print output to STDOUT
    def read do
        case IO.read(:stdio, :line) do
            :eof -> :ok
            {:error, reason} -> IO.puts "Error: #{reason}"
            data -> 
                IO.write(:stdio, "Hello, World. \n")
                IO.write(:stdio, data)
                read()
        end
    end
end

Solution.read()
