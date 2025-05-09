%% File: dev_echo.erl
-module(dev_echo).
-export([call/2, info/0]).

call("repeat", Data) ->
    {ok, #{echo => Data}};
call(_, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["repeat"]}.
