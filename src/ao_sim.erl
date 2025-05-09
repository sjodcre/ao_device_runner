-module(ao_sim).
-export([main/1]).

main([DeviceStr, KeyStr]) ->
    Result = dispatch(DeviceStr, KeyStr),
    io:format("~p~n", [Result]),
    halt(0);
main(_) ->
    io:format("Usage: ./ao_sim <Device> <Key>\n"),
    halt(1).

dispatch(DeviceStr, KeyStr) ->
    DeviceBin = list_to_binary(DeviceStr),
    case ao_registry:get_module(DeviceBin) of
        undefined ->
            {error, #{reason => io_lib:format("Device ~s not found", [DeviceStr])}};
        Module ->
            Module:call(KeyStr, #{})
    end.