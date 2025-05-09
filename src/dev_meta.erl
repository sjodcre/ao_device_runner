%% File: dev_meta.erl
-module(dev_meta).
-export([call/2, info/0]).

call("info", _Data) ->
    Devices = ao_registry:get_all_devices(),
    {ok, #{devices => Devices}};
call(_, _) ->
    {error, #{reason => <<"Unknown key">>}}.

info() ->
    #{keys => ["info"]}.
