defmodule Solution do

  ##require Flow

  def read_int do
      IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def read_str do
    IO.read(:line)
    |> String.trim()
  end

  def read_bin1() do
     IO.binstream(:stdio, :all)



  end

  def read_bin11x() do
    case IO.binread(:stdio, :all) do
      :eof -> :ok
       {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
        line = String.split(data)
        IO.inspect(line, label: "input line")
        line
      ##read([data]++list)
      ##g = data * 3
      ##[head | _tail ] = Tuple.to_list(Integer.parse(data))
      ##head
    end
  end

  def read_bin() do
  #  IO.binstream(:stdio, :line)
  #  |> Flow.from_enumerable()
  #  |> IO.puts
  end

  def test1() do

    :ets.new(:words, [{:write_concurrency, true}, :named_table])

    # setup input stream for reading and tokenisation
    #  IO.binstream(:stdio, :line)
    #     |> Stream.flat_map(&String.split(&1))
    #     |> Enum.each(fn word -> :ets.update_counter(:words, word, {2, 1}, {word, 0}) end)

    #:ets.match_object(:words, {:"$0", :"$1"})
     ##|> Enum.sort(fn {_, a}, {_, b} -> b < a end)
# print it beautifully
    # |> Enum.each(fn {word, count} ->
    #     IO.puts(String.pad_leading(Integer.to_string(count), 8) <> " " <> word)
    # end)

  end

  def working_test do

    :ets.new(:words, [{:write_concurrency, true}, :named_table])

    # setup input stream for reading and tokenisation
    i=0
    IO.binstream(:stdio, :line)
    #|> Stream.flat_map(&String.split(&1))
    |> Stream.map(&String.split(&1))
    ###|> Enum.each(fn word -> )
    |> Enum.each(fn word-> :ets.insert(:words, {word,1}) end)

    :ets.i(:words)
    |> IO.inspect


  end

  def read_command( ) do
    IO.binread(:stdio, :line)
    ##  |> Stream.map(&String.split(&1))



  end

  def test2() do
    ##IO.binstream(:stdio, :line)|> Stream.flat_map(&String.split(&1)) |> IO.inspect


    :ets.new(:words, [{:write_concurrency, true}, :named_table, :duplicate_bag])
    :ets.new(:nodes, [{:write_concurrency, true}, :named_table])
    :ets.new(:current, [{:write_concurrency, true}, :named_table])


# setup input stream for reading and tokenisation
i=0
IO.binstream(:stdio, :line)
#|> Stream.flat_map(&String.split(&1))
|> Stream.map(&String.split(&1))
###|> Enum.each(fn word -> )
|> Enum.each(fn word-> :ets.insert(:words, {word,[1,2,3]}) end)


# Insert and update counters for each word in table
# |> Enum.each(fn word -> i=i+1;IO.inspect(i);IO.inspect(word);["trevor"] |>
# Enum.reduce(fn (x, acc) -> IO.inspect x; IO.inspect x;:ets.insert(:words, {acc,x}) end)  end)
##  word |> Enum.filter(fn x, i ->
##  IO.inspect x; i=i+1;IO.inspect i end) end)
# |> Enum.filter(fn word, i ->
# :ets.insert(:words, {i+1,word}) end) end)
#|> Enum.each(fn x -> IO.inspect(x) end)
##Enum.each(fn word, i -> :ets.insert(:words, {i+1,word}) end)
# insert(:table, {1, "trevor"})

:ets.i(:words)
|> IO.inspect

IO.puts "key 1"
:ets.lookup(:words, 1)
|> IO.inspect

# Read all rows from the table
#
:ets.insert(:current, {1,0})


acc_dupes = fn({words, nodes}) ->

  [{n, cn}|_] =:ets.lookup(:current, 1)
  IO.inspect(words, label: "commands == ")
  #IO.inspect nodes
  [h|t]=words
  IO.inspect(cn, label: "current node")

  cond do
    String.contains?(h, "change") -> [cns|_]=t; cn1= String.to_integer(cns);
      :ets.insert(:current, {1, cn1})
    String.contains?(h, "print") -> IO.inspect(cn, label: "current node = ")
    true -> IO.puts "no match"
  end
 # IO.inspect(current_node, label: "current node")
  #  dupes |> IO.inspect(label: "dupes ")
   # case Map.has_key?(dupes, x) do
   #   true ->   Map.put(dupes, x, dupes[x]+1)
   #   false ->  Map.put(dupes, x, 1)
   # end

   end

:ets.match_object(:words, {:"$0", :"$1"})
#|> Enum.sort(fn {_, a}, {_, b} -> b < a end)
# print it beautifully
|> Enum.each(acc_dupes )

#|> Enum.each(fn {word, v} -> IO.puts( "#{word} #{v}")end )
 # IO.puts(String.pad_leading(Integer.to_string(count), 8) <> " " <> word)
#end)

end

  def gen_words(words, current_node) do
     change_cn(words, String.contains?(words, "change"), current_node)
  end

  def change_cn(words, true, cn) do
       list = List.codepoints(words)
       [h|t]=List.reverse(list)
       h
  end

  def change_cn(words, false, cn) do
    cn
  end

  def read_bin2() do

 #   IO.binstream(:stdio, :line)
 #   |> Flow.from_enumerable()
 #   |> Flow.flat_map(&String.split(&1))
 #   |> Flow.partition()
 #   |> Flow.reduce(fn -> %{} end, fn word, acc ->
 #      Map.update(acc, word, 1, & &1 + 1)
 #   end)
 #   |> Enum.sort(fn {_, a}, {_, b} -> b < a end)
 #   |> Enum.map(fn {word, count} ->
 #   [String.pad_leading(Integer.to_string(count), 8), " ", word, "\n"] end)
 #   |> IO.puts


  end

  def process(0, _) do
  end



  def handle(x) do
    IO.inspect(x, label: "handle x")
   # case x do
#
   # end
  end
#


def process(0, _word_table, _current_table, _node_table) do

end


  def process(count, word_table, current_table, node_table) do

  #  IO.inspect("read command")
    [head|tail] =  read_command() |> String.split()
    ## Enum.reduce(0,fn item, acc -> acc+1; IO.inspect acc end)
    ## |> Enum.each(fn word-> :ets.insert(word_table, {count, word}) end)
##IO.inspect(command)
#Enum.map(command, fn x -> x end)
   ## :ets.insert(word_table, {count,command})
   [cnh|cnt] = :ets.lookup(current_table, 1)
   {cn_key, cn} = cnh

   :ets.i(current_table)
   |> IO.inspect

   :ets.i(node_table)
   |> IO.inspect
   cond do
    String.match?(head, ~r/change/) -> [cns|_]=tail; cn1= String.to_integer(cns);
      :ets.insert(current_table, {1, cn1})
      x = :ets.lookup(node_table, cn1)
      cond do
        x == [] -> :ets.insert(node_table, {cn1, {[],[],[],[]}})
        true -> k = 1
      end
    String.match?(head, ~r/delete/) ->
      [{cn_read,{[p|_], left, right, children}}] = :ets.lookup(node_table, cn);
      :ets.delete(node_table, cn);
      :ets.insert(current_table, {1, p});
      cond do
        children != [] -> [c|children_rest] = children;
        delete_nodes(node_table,  children_rest, c);
        children == [] -> k = 1
      end


    String.match?(head, ~r/print/) -> IO.inspect cn
    String.match?(head, ~r/insert/) -> [h|t] = tail;
      cond do
        String.match?(h,~r/left/) ->   [t1|_]=t;

          [{cn_read,{parent, left, right, children}}] = :ets.lookup(node_table, cn);
          node_list = {parent, [String.to_integer(t1)]++left, right, children};
          :ets.insert(node_table, {cn, node_list})

          t2 = String.to_integer(t1)
          ## assume right does not exist
          node_list = {parent, left, [cn]++right, []};
          :ets.insert(node_table, {t2, node_list})


          for item <- left do
            [{item_read,{parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(right1, fn x -> x == cn end)
            right1 = List.insert_at(right1, index, t2)
            n_list = {parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end


          for item <- right do
            [{item_read,{parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(left1, fn x -> x == cn end)
            left1 = List.insert_at(left1, index, t2)
            n_list = {parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end


          [p|_]=parent
          x = :ets.lookup(node_table, t1);
          [{p,{p1, left1, right2, children}}] = :ets.lookup(node_table, p);

          index = Enum.find_index(children, fn x -> x == cn end)
          children = List.insert_at(children, index, t2)
           n_list = {p1, left1, right2, children}

          n_list = [{p,{p1, left1, right2, [t2]++children}}]
          :ets.insert(node_table, {p, n_list})

   #       :ets.i(node_table)
   #       |> IO.inspect
        String.match?(h, ~r/right/) ->
          [t1|_]=t;
          [{cn_read,{parent, left, right, children}}] = :ets.lookup(node_table, cn);
          node_list = {parent, left, [String.to_integer(t1)]++right, children};
          :ets.insert(node_table, {cn, node_list})
          t2 = String.to_integer(t1)
          ## assume right does not exist
          node_list = {parent, left, [t2]++right, []};

          :ets.insert(node_table, {t2, node_list})

          for item <- right do
            [{item_read,{parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(left1, fn x -> x == cn end)
            left1 = List.insert_at(left1, index+1, t2)
            n_list = {parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end

          for item <- left do
            [{item_read,{parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(right1, fn x -> x == cn end)
            right1 = List.insert_at(right1, index, t2)
            n_list = {parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end


          [p|_]=parent
          x = :ets.lookup(node_table, t1);
          [{p,{p1, left1, right2, children}}] = :ets.lookup(node_table, p);
         index = Enum.find_index(children, fn x -> x == cn end)
         children = List.insert_at(children, index+1, t2)
          n_list = {p1, left1, right2, children}


          :ets.insert(node_table, {p, n_list})
        String.match?(h, ~r/child/) ->
          [t1|_]=t;
         # IO.inspect(h, label: "h== ");
   # IO.inspect(t, label: "t=== ");
   # IO.inspect(t1, label: "t1=== ");
   # IO.inspect(cn, label: "cn=== ");

          [{cn_read,{parent, left, right, children}}] = :ets.lookup(node_table, cn);
          node_list = {parent, left, right, [String.to_integer(t1)]++children};
          :ets.insert(node_table, {cn, node_list})
          x = :ets.lookup(node_table, t1);
          cond do
            x == [] -> :ets.insert(node_table, {String.to_integer(t1), {[cn],[],children,[]}});
            for item <-children do
              IO.inspect(item, label: "updating item === ")
              [{item_read,{parent, left, right, children}}] = :ets.lookup(node_table, item);
              node_list1 = {parent, [String.to_integer(t1)]++left, right, children};
              :ets.insert(node_table, {item, node_list1})
            end

            true -> [{t1_read,{parent, left, right, children}}] = :ets.lookup(node_table, t1);
             node_list = {cn, left, right, children};
           #  IO.inspect "insert ======================"
            :ets.insert(node_table, {String.to_integer(t1), node_list})
          #  IO.inspect "insert after ===================="

   #:ets.i(node_table)
   #|> IO.inspect
          true -> k = 1
          end
      end
      String.match?(head, ~r/visit/) -> [h|t] = tail;
        cond do
          String.match?(h, ~r/left/) ->
            [{cn_read,{parent, [left|_], _right, children}}] = :ets.lookup(node_table, cn);
            :ets.insert(current_table, {1, left})
            x = :ets.lookup(node_table, left)
            cond do
              x == [] -> :ets.insert(node_table, {left, {parent,[],[],[]}})
              true -> k = 1
            end
            String.match?(h, ~r/right/) ->
              [{cn_read,{parent, _left, right, _children}}] = :ets.lookup(node_table, cn);
              IO.inspect(right, label: "right --= ")
              [r|_]=right
              :ets.insert(current_table, {1, r})
              x = :ets.lookup(node_table, r)


              ##[{cn_read,{parent, _left, [right], children}}] = [{2, {[1], [], [3], []}}]
              cond do
                x == [] ->  [p|_]=parent;:ets.insert(node_table, {r, {p,[],[],[]}})
                true -> k = 1
              end
            String.match?(h, ~r/parent/) ->
              [{cn_read,{parent, _left, _right, _children}}] = :ets.lookup(node_table, cn);
              [p|_]=parent
              :ets.insert(current_table, {1, p})
            String.match?(h, ~r/child/) ->
                [{cn_read,{parent, _left, _right, children}}] = :ets.lookup(node_table, cn);


                IO.inspect(t, label: "t == ");
                [r|_]=t;
                rn = String.to_integer(r)
                IO.inspect(parent, label: "parent == ");
                IO.inspect(children,label: "children == ");
                x = Enum.at(children, rn-1)
                :ets.insert(current_table, {1, x})
          true -> k = 1
        end
      true -> k =1
   # true -> IO.puts "no match"
  end
    #str = read_bin()
    #IO.inspect(str, label: "received data ")
    #Enum.each(str, fn x -> handle(x) end)

    process(count-1, word_table, current_table, node_table)
  end



  def delete_nodes(node_table, [], c) do
     :ets.delete(node_table, c);
  end

  def delete_nodes(node_table, children, c) do
    read_int()

        [{c_read,{[_], _, _, children}}] = :ets.lookup(node_table, c);
        [c|children_rest] = children;
      delete_nodes(node_table,  children_rest, c);

  end

  def main() do
    :ets.new(:words, [{:write_concurrency, true}, :named_table, :duplicate_bag])
    :ets.new(:nodes, [{:write_concurrency, true}, :named_table])
    :ets.new(:current, [{:write_concurrency, true}, :named_table])
## parent, rt siblig, lf sibling, children
    :ets.insert(:nodes, {0, {[],[],[],[]}})
    :ets.insert(:current, {1, 0}) ## key is 1

    count=read_int()
    process(count, :words, :current, :nodes)

   # :ets.i(:words)
   # |> IO.inspect
  end

end

Solution.main()
