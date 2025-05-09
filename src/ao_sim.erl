-module(ao_sim).
-export([main/1]).

main([DeviceStr, KeyStr, "--data", JsonStr]) ->
    case jsx:decode(list_to_binary(JsonStr), [return_maps]) of
        Map when is_map(Map) ->
            %% Convert <<"a">> => a
            AtomMap = maps:from_list([
                {binary_to_atom(K, utf8), V} || {K, V} <- maps:to_list(Map)
            ]),
            Result = dispatch(DeviceStr, KeyStr, AtomMap),
            io:format("~p~n", [Result]),
            halt(0);
        _ ->
            io:format("Invalid JSON data.\n"),
            halt(1)
    end;

main([DeviceStr, KeyStr]) ->
    Result = dispatch(DeviceStr, KeyStr, #{}),
    io:format("~p~n", [Result]),
    halt(0);

main(_) ->
    io:format("Usage: ./ao_sim <Device> <Key>\n"),
    halt(1).


dispatch(DeviceStr, KeyStr, Data) ->
    DeviceBin = list_to_binary(DeviceStr),
    case ao_registry:get_module(DeviceBin) of
        undefined ->
            {error, #{reason => io_lib:format("Device ~s not found", [DeviceStr])}};
        Module ->
            Module:call(KeyStr, Data)
    end.