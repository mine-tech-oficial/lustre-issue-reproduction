-module(app).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/app.gleam").
-export([main/0]).
-export_type([counter_socket/0]).

-type counter_socket() :: {counter_socket,
        lustre:runtime(component:message()),
        gleam@erlang@process:subject(lustre@runtime@transport:client_message(component:message()))}.

-file("src/app.gleam", 215).
-spec close_counter_socket(counter_socket()) -> nil.
close_counter_socket(State) ->
    _pipe = lustre:shutdown(),
    gleam@erlang@process:send(erlang:element(2, State), _pipe).

-file("src/app.gleam", 177).
-spec loop_counter_socket(
    counter_socket(),
    mist:websocket_message(lustre@runtime@transport:client_message(component:message())),
    mist@internal@websocket:websocket_connection()
) -> mist:next(counter_socket(), lustre@runtime@transport:client_message(component:message())).
loop_counter_socket(State, Message, Connection) ->
    case Message of
        {text, Json} ->
            case gleam@json:parse(
                Json,
                lustre@server_component:runtime_message_decoder()
            ) of
                {ok, Runtime_message} ->
                    gleam@erlang@process:send(
                        erlang:element(2, State),
                        Runtime_message
                    );

                {error, _} ->
                    nil
            end,
            mist:continue(State);

        {binary, _} ->
            mist:continue(State);

        {custom, Client_message} ->
            Json@1 = lustre@server_component:client_message_to_json(
                Client_message
            ),
            case mist:send_text_frame(Connection, gleam@json:to_string(Json@1)) of
                {ok, _} -> nil;
                _assert_fail ->
                    erlang:error(#{gleam_error => let_assert,
                                message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                                file => <<?FILEPATH/utf8>>,
                                module => <<"app"/utf8>>,
                                function => <<"loop_counter_socket"/utf8>>,
                                line => 206,
                                value => _assert_fail,
                                start => 7931,
                                'end' => 8004,
                                pattern_start => 7942,
                                pattern_end => 7947})
            end,
            mist:continue(State);

        closed ->
            mist:stop();

        shutdown ->
            mist:stop()
    end.

-file("src/app.gleam", 149).
-spec init_counter_socket(any()) -> {counter_socket(),
    gleam@option:option(gleam@erlang@process:selector(lustre@runtime@transport:client_message(component:message())))}.
init_counter_socket(_) ->
    Counter = component:component(),
    Component@1 = case lustre:start_server_component(Counter, nil) of
        {ok, Component} -> Component;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"init_counter_socket"/utf8>>,
                        line => 155,
                        value => _assert_fail,
                        start => 5783,
                        'end' => 5853,
                        pattern_start => 5794,
                        pattern_end => 5807})
    end,
    Self = gleam@erlang@process:new_subject(),
    Selector = begin
        _pipe = gleam_erlang_ffi:new_selector(),
        gleam@erlang@process:select(_pipe, Self)
    end,
    _pipe@1 = lustre@server_component:register_subject(Self),
    gleam@erlang@process:send(Component@1, _pipe@1),
    {{counter_socket, Component@1, Self}, {some, Selector}}.

-file("src/app.gleam", 127).
-spec serve_counter(gleam@http@request:request(mist@internal@http:connection())) -> gleam@http@response:response(mist:response_data()).
serve_counter(Request) ->
    mist:websocket(
        Request,
        fun loop_counter_socket/3,
        fun init_counter_socket/1,
        fun close_counter_socket/1
    ).

-file("src/app.gleam", 102).
-spec serve_runtime() -> gleam@http@response:response(mist:response_data()).
serve_runtime() ->
    Lustre_priv@1 = case gleam_erlang_ffi:priv_directory(<<"lustre"/utf8>>) of
        {ok, Lustre_priv} -> Lustre_priv;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"serve_runtime"/utf8>>,
                        line => 110,
                        value => _assert_fail,
                        start => 4302,
                        'end' => 4367,
                        pattern_start => 4313,
                        pattern_end => 4328})
    end,
    File_path = <<Lustre_priv@1/binary,
        "/static/lustre-server-component.mjs"/utf8>>,
    case mist:send_file(File_path, 0, none) of
        {ok, File} ->
            _pipe = gleam@http@response:new(200),
            _pipe@1 = gleam@http@response:prepend_header(
                _pipe,
                <<"content-type"/utf8>>,
                <<"application/javascript"/utf8>>
            ),
            gleam@http@response:set_body(_pipe@1, File);

        {error, _} ->
            _pipe@2 = gleam@http@response:new(404),
            gleam@http@response:set_body(
                _pipe@2,
                {bytes, gleam@bytes_tree:new()}
            )
    end.

-file("src/app.gleam", 49).
-spec serve_html() -> gleam@http@response:response(mist:response_data()).
serve_html() ->
    Html = begin
        _pipe = lustre@element@html:html(
            [lustre@attribute:lang(<<"en"/utf8>>)],
            [lustre@element@html:head(
                    [],
                    [lustre@element@html:meta(
                            [lustre@attribute:charset(<<"utf-8"/utf8>>)]
                        ),
                        lustre@element@html:meta(
                            [lustre@attribute:name(<<"viewport"/utf8>>),
                                lustre@attribute:content(
                                    <<"width=device-width, initial-scale=1"/utf8>>
                                )]
                        ),
                        lustre@element@html:title([], <<"Test"/utf8>>),
                        lustre@element@html:script(
                            [lustre@attribute:type_(<<"module"/utf8>>),
                                lustre@attribute:src(
                                    <<"/lustre/runtime.mjs"/utf8>>
                                )],
                            <<""/utf8>>
                        )]
                ),
                lustre@element@html:body(
                    [lustre@attribute:styles(
                            [{<<"max-width"/utf8>>, <<"32rem"/utf8>>},
                                {<<"margin"/utf8>>, <<"3rem auto"/utf8>>}]
                        )],
                    [lustre@server_component:element(
                            [lustre@server_component:route(<<"/ws"/utf8>>)],
                            [lustre@element@html:'div'(
                                    [lustre@attribute:id(<<"app"/utf8>>)],
                                    []
                                )]
                        ),
                        lustre@element@html:script(
                            [],
                            <<"document.querySelector('lustre-server-component').addEventListener('ready', (event) => {console.log(\"hi!\")});"/utf8>>
                        )]
                )]
        ),
        _pipe@1 = lustre@element:to_document_string_tree(_pipe),
        gleam_stdlib:wrap_list(_pipe@1)
    end,
    _pipe@2 = gleam@http@response:new(200),
    _pipe@3 = gleam@http@response:set_body(_pipe@2, {bytes, Html}),
    gleam@http@response:set_header(
        _pipe@3,
        <<"content-type"/utf8>>,
        <<"text/html"/utf8>>
    ).

-file("src/app.gleam", 20).
-spec main() -> nil.
main() ->
    Priv_dir@1 = case gleam_erlang_ffi:priv_directory(<<"app"/utf8>>) of
        {ok, Priv_dir} -> Priv_dir;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"main"/utf8>>,
                        line => 21,
                        value => _assert_fail,
                        start => 655,
                        'end' => 714,
                        pattern_start => 666,
                        pattern_end => 678})
    end,
    case begin
        _pipe = fun(Request) ->
            case gleam@http@request:path_segments(Request) of
                [] ->
                    serve_html();

                [<<"lustre"/utf8>>, <<"runtime.mjs"/utf8>>] ->
                    serve_runtime();

                [<<"ws"/utf8>>] ->
                    serve_counter(Request);

                _ ->
                    gleam@http@response:set_body(
                        gleam@http@response:new(404),
                        {bytes, gleam@bytes_tree:new()}
                    )
            end
        end,
        _pipe@1 = mist:new(_pipe),
        _pipe@2 = mist:bind(_pipe@1, <<"localhost"/utf8>>),
        _pipe@3 = mist:port(_pipe@2, 1234),
        mist:start(_pipe@3)
    end of
        {ok, _} -> nil;
        _assert_fail@1 ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"main"/utf8>>,
                        line => 22,
                        value => _assert_fail@1,
                        start => 717,
                        'end' => 1659,
                        pattern_start => 728,
                        pattern_end => 733})
    end,
    gleam_erlang_ffi:sleep_forever().
