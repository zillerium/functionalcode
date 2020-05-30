% hello world program
-module(hello2).
-export([helloworld/0]).

helloworld() -> io:fwrite("Hello World!\n").
