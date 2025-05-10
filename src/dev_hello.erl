-module(dev_hello).
% -export([call/2, info/0]).
-export([call/4, info/0]).

call("greet", M1, _M2, Env) ->
    io:format("~n[dev_hello] M1: ~p~nEnv: ~p~n", [M1, Env]),
    {ok, #{message => <<"Hello from ~hello@1.0!">>}};
call(_, _, _, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["greet"]}.
