-module(demo1).
-export([hello/0]).

hello()->
  receive
    {FromPID, Who} ->
      case Who of
        john->FromPID!"Hello John.";
        andrew->FromPID!"hello Andrew";
        _->FromPID!"Unknown"
      end,
      hello()
end. 
