%% File: dev_echo.erl
-module(dev_echo).
% -export([call/2, info/0]).
-export([call/4, info/0]).

call("repeat", M1, M2, Env) ->
    io:format("~n[dev_echo] M1: ~p~nEnv: ~p~n", [M1, Env]),
    {ok, #{echo => M2}};
call(_, _, _, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["repeat"]}.
