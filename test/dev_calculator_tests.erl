%% File: test/dev_calculator_tests.erl
-module(dev_calculator_tests).
-include_lib("eunit/include/eunit.hrl").

dummy_m1() -> #{sender => <<"test">>, sig => <<"none">>}.
dummy_env() -> #{timestamp => 0, host => <<"test">>}.

add_test_() ->
    ?_assertEqual({ok, #{result => 5}},
        dev_calculator:call("add", dummy_m1(), #{a => 2, b => 3}, dummy_env())).

sub_test_() ->
    ?_assertEqual({ok, #{result => -1}},
        dev_calculator:call("sub", dummy_m1(), #{a => 2, b => 3}, dummy_env())).

mul_test_() ->
    ?_assertEqual({ok, #{result => 6}},
        dev_calculator:call("mul", dummy_m1(), #{a => 2, b => 3}, dummy_env())).

div_test_() ->
    ?_assertEqual({ok, #{result => 2.0}},
        dev_calculator:call("div", dummy_m1(), #{a => 6, b => 3}, dummy_env())).

bad_input_test_() ->
    ?_assertMatch({error, _},
        dev_calculator:call("add", dummy_m1(), #{a => 2}, dummy_env())).

unknown_key_test_() ->
    ?_assertMatch({error, _},
        dev_calculator:call("pow", dummy_m1(), #{a => 2, b => 3}, dummy_env())).
