-module(p).
-export([start/0]).

start() ->
    process_flag(trap_exit, true),
    P = open_port({fd,0,1}, [in, binary]),
    Bin = read(P,<<>>),
    io:format("received ~p\n", [Bin]),
    halt(0).

read(P, Bin) ->
    receive
        {P, {data, Data}} ->
            read(P, <<Bin/binary, Data/binary>>);
        {'EXIT',P,_} ->
            Bin
    end.
The code has to trap exits so it knows to exit its reading loop when the port closes. This example reads everything into a single binary returned from the read/2 function and then prints it out and exits, but obviously you can perform further operations on the binary in your actual application.

You can run this like this:

erl -noinput -s p < input
