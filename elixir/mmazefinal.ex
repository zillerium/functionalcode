defmodule Solution do

  ##require Flow

  def read_int do
      IO.read(:line) |> String.trim() |> String.to_integer()
  end

  def read_command( ) do
    IO.binread(:stdio, :line)
    ##  |> Stream.map(&String.split(&1))
  end

def process(0, _word_table, _current_table, _node_table) do

end


  def process(count, word_table, current_table, node_table) do


    [head|tail] =  read_command() |> String.split()

#Enum.map(command, fn x -> x end)
   ## :ets.insert(word_table, {count,command})
   [cnh|cnt] = :ets.lookup(current_table, 1)
   {cn_key, cn} = cnh


   cond do
      String.match?(head, ~r/change/) -> [cns|_]=tail; cn1= String.to_integer(cns);

        [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, cn);
node_list = {[cn1], parent, left, right, children}
        :ets.insert(node_table, {cn, node_list})


      String.match?(head, ~r/delete/) ->
        [{cn_read,{kv, [p|_], leftx, rightx, childrenx}}] = :ets.lookup(node_table, cn);
        :ets.delete(node_table, cn);

        for item <- leftx do
          [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, item);
          index = Enum.find_index(right, fn x -> x == cn end)
          if index != nil do
            right = List.delete_at(right, index)
            n_list = {kv, parent, left, right, children}
            :ets.insert(node_table, {item, n_list})
          end
          index = Enum.find_index(left, fn x -> x == cn end)
          if index != nil do
            left = List.delete_at(left, index)
            n_list = {kv, parent, left, right, children}
            :ets.insert(node_table, {item, n_list})
          end
        end

        for item <- rightx do
          [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, item);

          index = Enum.find_index(right, fn x -> x == cn end)
          if index != nil do
            right = List.delete_at(right, index)
            n_list = {kv, parent, left, right, children}
            :ets.insert(node_table, {item, n_list})
          end
          index = Enum.find_index(left, fn x -> x == cn end)
          if index != nil do

            left = List.delete_at(left, index)
            n_list = {kv, parent, left, right, children}
            :ets.insert(node_table, {item, n_list})
          end
        end

        :ets.insert(current_table, {1, p});

        ## remove key from children list in parent
        [{cn_read,{kv, parentp, leftp, rightp, childrenp}}] = :ets.lookup(node_table, p);

        index = Enum.find_index(childrenp, fn x -> x == cn end)
        if index != nil do
          childrenp = List.delete_at(childrenp, index)

          nlist = {kv, parentp, leftp, rightp, childrenp}
          :ets.insert(node_table, {p, nlist});
        end

        cond do
          childrenx != [] -> [c|children_rest] = childrenx;
          delete_nodes(node_table,  children_rest, c);
          childrenx == [] -> k = 1
        end


      String.match?(head, ~r/print/) ->
        #[{item_read,{kv, parent1, left1, right1, children1}}]=[{0, {[], [], [], [], []}}]
        [{item_read,{kv, parent1, left1, right1, children1}}] = :ets.lookup(node_table, cn);
        [k|_] = kv
        IO.inspect k
##:ets.i(node_table) |> IO.inspect
      String.match?(head, ~r/insert/) -> [h|t] = tail;
      cond do
        String.match?(h,~r/left/) ->   [t1|_]=t;

          [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, cn);
          node_list = {kv, parent, left++[String.to_integer(t1)], right, children};
          :ets.insert(node_table, {cn, node_list})

          t2 = String.to_integer(t1)
          ## assume right does not exist
          node_list = {[t2], parent, left, [cn]++right, []};
          :ets.insert(node_table, {t2, node_list})


          for item <- left do
            [{item_read,{kv, parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(right1, fn x -> x == cn end)
            right1 = List.insert_at(right1, index, t2)
            n_list = {kv, parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end


          for item <- right do
            [{item_read,{kv, parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(left1, fn x -> x == cn end)
            left1 = List.insert_at(left1, index, t2)
            n_list = {kv, parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end

          if parent != [] do
          [p|_]=parent
          x = :ets.lookup(node_table, t1);
          [{p,{kv, p1, left1, right2, children}}] = :ets.lookup(node_table, p);

          index = Enum.find_index(children, fn x -> x == cn end)
          children = List.insert_at(children, index, t2)
           n_list = {kv, p1, left1, right2, children}

        ##  n_list = [{p,{p1, left1, right2, children}}]
          :ets.insert(node_table, {p, n_list})

          end


        String.match?(h, ~r/right/) ->
          [t1|_]=t;
          [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, cn);
          node_list = {kv, parent, left, [String.to_integer(t1)]++right, children};
          :ets.insert(node_table, {cn, node_list})

          t2 = String.to_integer(t1)
          ## assume right does not exist
          node_list = {[t2], parent, left++[cn], right, []};

          :ets.insert(node_table, {t2, node_list})

          for item <- right do
            [{item_read,{kv, parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(left1, fn x -> x == cn end)
            left1 = List.insert_at(left1, index+1, t2)
            n_list = {kv, parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end

          for item <- left do
            [{item_read,{kv, parent1, left1, right1, children1}}] = :ets.lookup(node_table, item);
            index = Enum.find_index(right1, fn x -> x == cn end)
            right1 = List.insert_at(right1, index+1, t2)
            n_list = {kv, parent1, left1, right1, children1}
            :ets.insert(node_table, {item, n_list})
          end

          if parent != [] do
          [p|_]=parent
          x = :ets.lookup(node_table, t1);
          [{p,{kv, p1, left1, right2, children}}] = :ets.lookup(node_table, p);
          index = Enum.find_index(children, fn x -> x == cn end)
          children = List.insert_at(children, index+1, t2)
          n_list = {kv, p1, left1, right2, children}


          :ets.insert(node_table, {p, n_list})
          end
        String.match?(h, ~r/child/) ->
        [t1|_]=t;
        [{cn_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, cn);
        node_list = {kv, parent, left, right, [String.to_integer(t1)]++children};
        :ets.insert(node_table, {cn, node_list})
        x = :ets.lookup(node_table, t1);
        cond do
          x == [] -> :ets.insert(node_table, {String.to_integer(t1), {[String.to_integer(t1)], [cn],[],children,[]}});
          for item <-children do
             [{item_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, item);
            node_list1 = {kv, parent, [String.to_integer(t1)]++left, right, children};
            :ets.insert(node_table, {item, node_list1})
          end

          true -> [{t1_read,{kv, parent, left, right, children}}] = :ets.lookup(node_table, t1);
            node_list = {cn, cn, left, right, children};
           :ets.insert(node_table, {String.to_integer(t1), node_list})
         end
        true -> k = 1
    end
      String.match?(head, ~r/visit/) -> [h|t] = tail;
        cond do
          String.match?(h, ~r/left/) ->
            [{cn_read,{kv, parent, leftx, _right, children}}] = :ets.lookup(node_table, cn);
            if leftx != [] do
              [left|_]=Enum.reverse(leftx)

            :ets.insert(current_table, {1, left})
            x = :ets.lookup(node_table, left)
            cond do
              x == [] -> :ets.insert(node_table, {left, {kv, parent,[],[],[]}})
              true -> k = 1
            end
          end
            String.match?(h, ~r/right/) ->
              [{cn_read,{kv, parent, _left, rightx, _children}}] = :ets.lookup(node_table, cn);
              if rightx != [] do
              [r|_]=rightx
              :ets.insert(current_table, {1, r})
              x = :ets.lookup(node_table, r)


              ##[{cn_read,{parent, _left, [right], children}}] = [{2, {[1], [], [3], []}}]
              cond do
                x == [] ->  [p|_]=parent;:ets.insert(node_table, {r, {p, p,[],[],[]}})
                true -> k = 1
              end
            end
            String.match?(h, ~r/parent/) ->
              [{cn_read,{kv, parent, _left, _right, _children}}] = :ets.lookup(node_table, cn);
              [p|_]=parent
              :ets.insert(current_table, {1, p})
            String.match?(h, ~r/child/) ->
                [{cn_read,{kv, parent, _left, _right, children}}] = :ets.lookup(node_table, cn);


                [r|_]=t;
                rn = String.to_integer(r)
                x = Enum.at(children, rn-1)
                :ets.insert(current_table, {1, x})
          true -> k = 1
        end
      true -> k =1
   # true -> IO.puts "no match"
  end
    #str = read_bin()

    process(count-1, word_table, current_table, node_table)
  end



  def delete_nodes(node_table, [], c) do
    :ets.delete(node_table, c);
  end

  def delete_nodes(node_table, children, c) do
 ##   read_int()
        [{c_read,{kv, [_], _, _, childrenx}}] = :ets.lookup(node_table, c);
        :ets.delete(node_table, c);
        if childrenx != [] do
          [cx|children_rest]=childrenx
          delete_nodes(node_table, children_rest, cx)

        end
        if children != [] do
          [cx|children_rest]=children
          delete_nodes(node_table, children_rest, cx)

        end

  end



  def main() do
    :ets.new(:words, [{:write_concurrency, true}, :named_table, :duplicate_bag])
    :ets.new(:nodes, [{:write_concurrency, true}, :named_table])
    :ets.new(:current, [{:write_concurrency, true}, :named_table])
## parent, right siblig, left sibling, children
    :ets.insert(:nodes, {0, {[0], [],[],[],[]}})
    :ets.insert(:current, {1, 0}) ## key is 1

    count=read_int()
    process(count, :words, :current, :nodes)


  end

end

Solution.main()
