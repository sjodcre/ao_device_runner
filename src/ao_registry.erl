%% File: ao_registry.erl
-module(ao_registry).
-export([get_module/1]).

get_module(DeviceBin) ->
    DeviceMap = #{
        <<"hello@1.0">> => dev_hello,
        <<"calculator@1.0">> => dev_calculator
    },
    maps:get(DeviceBin, DeviceMap, undefined).
