%% File: dev_calculator.erl
-module(dev_calculator).
-export([call/2, info/0]).

call("add", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A + B}};
call("sub", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A - B}};
call("mul", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A * B}};
call("div", #{a := A, b := B}) when is_number(A), is_number(B), B =/= 0 ->
    {ok, #{result => A / B}};
call(_, _) ->
    {error, #{reason => <<"Invalid operation or data">>}}.

info() ->
    #{keys => ["add", "sub", "mul", "div"]}.
