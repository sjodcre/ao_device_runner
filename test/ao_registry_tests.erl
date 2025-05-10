%% File: test/ao_registry_tests.erl
-module(ao_registry_tests).
-include_lib("eunit/include/eunit.hrl").

registry_lookup_test_() ->
    Keys = ao_registry:get_all_devices(),
    [ begin
        Module = ao_registry:get_module(Key),
        ?_assertMatch({module, _}, code:ensure_loaded(Module))
      end || Key <- Keys,
             ao_registry:get_module(Key) =/= undefined ].

registry_module_exports_test_() ->
    Keys = ao_registry:get_all_devices(),
    [ begin
        Module = ao_registry:get_module(Key),
        _ = ?_assertEqual(true, erlang:function_exported(Module, call, 4)),
        _ = ?_assertEqual(true, erlang:function_exported(Module, info, 0))
      end || Key <- Keys,
             ao_registry:get_module(Key) =/= undefined ].
