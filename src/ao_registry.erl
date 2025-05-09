%% File: ao_registry.erl
-module(ao_registry).
-export([get_module/1, get_all_devices/0]).

%% Internal shared device map
device_map() ->
    #{
        <<"hello@1.0">> => dev_hello,
        <<"echo@1.0">> => dev_echo,
        <<"meta@1.0">> => dev_meta,
        <<"calculator@1.0">> => dev_calculator

    }.

get_module(DeviceBin) ->
    maps:get(DeviceBin, device_map(), undefined).

get_all_devices() ->
    maps:keys(device_map()).
