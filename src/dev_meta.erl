%% File: dev_meta.erl
-module(dev_meta).
% -export([call/2, info/0]).
-export([call/4, info/0]).

call("info", M1, _M2, Env) ->
    io:format("~n[dev_meta] M1: ~p~nEnv: ~p~n", [M1, Env]),
    Devices = ao_registry:get_all_devices(),
    {ok, #{devices => Devices}};
call(_, _, _, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["info"]}.
