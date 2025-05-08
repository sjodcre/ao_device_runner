-module(dev_hello).
-export([call/2, info/0]).

call("greet", _Data) ->
    {ok, #{message => <<"Hello from ~hello@1.0!">>}};
call(_, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["greet"]}.
