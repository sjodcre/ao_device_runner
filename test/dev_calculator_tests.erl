%% File: test/dev_calculator_tests.erl
-module(dev_calculator_tests).
-include_lib("eunit/include/eunit.hrl").

add_test_() ->
    ?_assertEqual({ok, #{result => 5}}, dev_calculator:call("add", #{a => 2, b => 3})).

sub_test_() ->
    ?_assertEqual({ok, #{result => -1}}, dev_calculator:call("sub", #{a => 2, b => 3})).

mul_test_() ->
    ?_assertEqual({ok, #{result => 6}}, dev_calculator:call("mul", #{a => 2, b => 3})).

div_test_() ->
    ?_assertEqual({ok, #{result => 2.0}}, dev_calculator:call("div", #{a => 6, b => 3})).

bad_input_test_() ->
    ?_assertMatch({error, _}, dev_calculator:call("add", #{a => 2})).

unknown_key_test_() ->
    ?_assertMatch({error, _}, dev_calculator:call("pow", #{a => 2, b => 3})).
