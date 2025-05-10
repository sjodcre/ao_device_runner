% %% File: dev_calculator.erl
% -module(dev_calculator).
% % -export([call/2, info/0]).
% -export([call/4, info/0]).

% call("add", _M1, #{a := A, b := B}, _Env) when is_number(A), is_number(B) ->
%     {ok, #{result => A + B}};
% call("sub", _M1, #{a := A, b := B}, _Env) when is_number(A), is_number(B) ->
%     {ok, #{result => A - B}};
% call("mul", _M1, #{a := A, b := B}, _Env) when is_number(A), is_number(B) ->
%     {ok, #{result => A * B}};
% call("div", _M1, #{a := A, b := B}, _Env) when is_number(A), is_number(B), B =/= 0 ->
%     {ok, #{result => A / B}};
% call(_, _, _, _) ->
%     {error, #{reason => <<"Invalid operation or data">>}}.

% info() ->
%     #{keys => ["add", "sub", "mul", "div"]}.

-module(dev_calculator).
-export([call/4, info/0]).

call(Op, M1, M2, Env) ->
    io:format("~n[dev_calculator] M1: ~p~nEnv: ~p~n", [M1, Env]),
    do_calc(Op, M2).

do_calc("add", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A + B}};
do_calc("sub", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A - B}};
do_calc("mul", #{a := A, b := B}) when is_number(A), is_number(B) ->
    {ok, #{result => A * B}};
do_calc("div", #{a := A, b := B}) when is_number(A), is_number(B), B =/= 0 ->
    {ok, #{result => A / B}};
do_calc(_, _) ->
    {error, #{reason => <<"Invalid operation or data">>}}.

info() ->
    #{keys => ["add", "sub", "mul", "div"]}.
