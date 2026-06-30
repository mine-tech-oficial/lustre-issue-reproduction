-module(lustre@runtime@app).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/lustre/runtime/app.gleam").
-export([configure/1, configure_server_component/1]).
-export_type([app/3, config/1, option/1]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(false).

-type app(LPV, LPW, LPX) :: {app,
        gleam@option:option(gleam@erlang@process:name(lustre@runtime@server@runtime:message(LPX))),
        fun((LPV) -> {LPW, lustre@effect:effect(LPX)}),
        fun((LPW, LPX) -> {LPW, lustre@effect:effect(LPX)}),
        fun((LPW) -> lustre@vdom@vnode:element(LPX)),
        config(LPX)}.

-type config(LPY) :: {config,
        boolean(),
        boolean(),
        boolean(),
        list({binary(), fun((binary()) -> {ok, LPY} | {error, nil})}),
        list({binary(), gleam@dynamic@decode:decoder(LPY)}),
        list({binary(), gleam@dynamic@decode:decoder(LPY)}),
        boolean(),
        gleam@option:option(fun((binary()) -> LPY)),
        gleam@option:option(LPY),
        gleam@option:option(fun((binary()) -> LPY)),
        gleam@option:option(fun((boolean()) -> LPY)),
        gleam@option:option(LPY),
        gleam@option:option(LPY),
        gleam@option:option(LPY)}.

-type option(LPZ) :: {option, fun((config(LPZ)) -> config(LPZ))}.

-file("src/lustre/runtime/app.gleam", 73).
?DOC(false).
-spec configure(list(option(LQA))) -> config(LQA).
configure(Options) ->
    gleam@list:fold(
        Options,
        {config,
            true,
            true,
            false,
            [],
            [],
            [],
            false,
            none,
            none,
            none,
            none,
            none,
            none,
            none},
        fun(Config, Option) -> (erlang:element(2, Option))(Config) end
    ).

-file("src/lustre/runtime/app.gleam", 77).
?DOC(false).
-spec configure_server_component(config(LQE)) -> lustre@runtime@server@runtime:config(LQE).
configure_server_component(Config) ->
    {config,
        erlang:element(2, Config),
        erlang:element(3, Config),
        maps:from_list(lists:reverse(erlang:element(5, Config))),
        maps:from_list(lists:reverse(erlang:element(6, Config))),
        maps:from_list(lists:reverse(erlang:element(7, Config))),
        erlang:element(13, Config),
        erlang:element(15, Config)}.
