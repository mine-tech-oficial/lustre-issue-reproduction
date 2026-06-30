-module(component).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/component.gleam").
-export([component/0]).
-export_type([model/0, message/0]).

-type model() :: {model, integer()}.

-type message() :: inc | dec.

-file("src/component.gleam", 35).
-spec view(model()) -> lustre@vdom@vnode:element(message()).
view(Model) ->
    lustre@element:fragment(
        [lustre@element@html:'div'(
                [],
                [lustre@element@html:button(
                        [lustre@event:on_click(inc)],
                        [lustre@element@html:text(<<"+"/utf8>>)]
                    ),
                    lustre@element@html:text(
                        erlang:integer_to_binary(erlang:element(2, Model))
                    ),
                    lustre@element@html:button(
                        [lustre@event:on_click(dec)],
                        [lustre@element@html:text(<<"-"/utf8>>)]
                    )]
            )]
    ).

-file("src/component.gleam", 28).
-spec update(model(), message()) -> {model(), lustre@effect:effect(message())}.
update(Model, Message) ->
    case Message of
        inc ->
            {{model, erlang:element(2, Model) + 1}, lustre@effect:none()};

        dec ->
            {{model, erlang:element(2, Model) - 1}, lustre@effect:none()}
    end.

-file("src/component.gleam", 24).
-spec init(any()) -> {model(), lustre@effect:effect(message())}.
init(_) ->
    {{model, 0}, lustre@event:emit(<<"ready"/utf8>>, gleam@json:null())}.

-file("src/component.gleam", 20).
-spec component() -> lustre@runtime@app:app(any(), model(), message()).
component() ->
    lustre:component(fun init/1, fun update/2, fun view/1, []).
