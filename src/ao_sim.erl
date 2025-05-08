-module(ao_sim).
-export([main/1]).

main([DeviceStr, KeyStr]) ->
    Result = dispatch(DeviceStr, KeyStr),
    io:format("~p~n", [Result]),
    halt(0);
main(_) ->
    io:format("Usage: ./ao_sim <Device> <Key>\n"),
    halt(1).

dispatch("hello@1.0", Key) ->
    dev_hello:call(Key, #{});  % pass empty map for now
dispatch(Device, _) ->
    {error, #{reason => io_lib:format("Device ~s not found", [Device])}}.
