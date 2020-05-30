-module(hello).
-export([helloworld/0]).

helloworld()->io:fwrite("hello world~n").
