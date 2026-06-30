-module(pprint).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).
-define(FILEPATH, "src/pprint.gleam").
-export([from/1, with_config/2, debug/1, format/1, styled/1]).
-export_type([config/0, style_mode/0, bit_array_mode/0, label_mode/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

-type config() :: {config, style_mode(), bit_array_mode(), label_mode()}.

-type style_mode() :: styled | unstyled.

-type bit_array_mode() :: bit_arrays_as_string | keep_bit_arrays.

-type label_mode() :: labels | no_labels.

-file("src/pprint.gleam", 124).
-spec from(any()) -> gleam@dynamic:dynamic_().
from(Value) ->
    pprint_ffi:from(Value).

-file("src/pprint.gleam", 323).
-spec comma_list_space(
    list(glam@doc:document()),
    glam@doc:document(),
    glam@doc:document(),
    glam@doc:document()
) -> glam@doc:document().
comma_list_space(Docs, Open, Close, Space) ->
    Trailing = case Docs of
        [] ->
            {concat, []};

        _ ->
            glam@doc:break(<<""/utf8>>, <<","/utf8>>)
    end,
    _pipe@2 = [Open,
        begin
            _pipe = [{break, <<""/utf8>>, <<""/utf8>>},
                glam@doc:concat_join(
                    Docs,
                    [glam@doc:from_string(<<","/utf8>>), Space]
                )],
            _pipe@1 = glam@doc:concat(_pipe),
            glam@doc:nest(_pipe@1, 2)
        end,
        Trailing,
        Close],
    _pipe@3 = glam@doc:concat(_pipe@2),
    glam@doc:group(_pipe@3).

-file("src/pprint.gleam", 319).
-spec comma_list(
    list(glam@doc:document()),
    glam@doc:document(),
    glam@doc:document()
) -> glam@doc:document().
comma_list(Docs, Open, Close) ->
    comma_list_space(Docs, Open, Close, {break, <<" "/utf8>>, <<""/utf8>>}).

-file("src/pprint.gleam", 303).
-spec ansi(binary(), binary(), config()) -> glam@doc:document().
ansi(Text, Code, Config) ->
    Text_doc = glam@doc:from_string(Text),
    case erlang:element(2, Config) of
        unstyled ->
            Text_doc;

        styled ->
            glam@doc:concat(
                [glam@doc:zero_width_string(Code),
                    Text_doc,
                    glam@doc:zero_width_string(<<"\x{001b}[0m"/utf8>>)]
            )
    end.

-file("src/pprint.gleam", 185).
-spec pretty_string(binary(), config()) -> glam@doc:document().
pretty_string(String, Config) ->
    _pipe = (<<<<"\""/utf8, String/binary>>/binary, "\""/utf8>>),
    ansi(_pipe, <<"\x{001b}[38;5;2m"/utf8>>, Config).

-file("src/pprint.gleam", 190).
-spec pretty_bit_array(bitstring(), config()) -> glam@doc:document().
pretty_bit_array(Bits, Config) ->
    _pipe = gleam@string:inspect(Bits),
    ansi(_pipe, <<"\x{001b}[38;5;5m"/utf8>>, Config).

-file("src/pprint.gleam", 225).
-spec pretty_tuple(list(gleam@dynamic:dynamic_()), config()) -> glam@doc:document().
pretty_tuple(Items, Config) ->
    _pipe = gleam@list:map(
        Items,
        fun(_capture) -> pretty_dynamic(_capture, Config) end
    ),
    comma_list(
        _pipe,
        glam@doc:from_string(<<"#("/utf8>>),
        glam@doc:from_string(<<")"/utf8>>)
    ).

-file("src/pprint.gleam", 179).
-spec pretty_dynamic(gleam@dynamic:dynamic_(), config()) -> glam@doc:document().
pretty_dynamic(Value, Config) ->
    _pipe = Value,
    _pipe@1 = pprint@decoder:classify(_pipe),
    pretty_type(_pipe@1, Config).

-file("src/pprint.gleam", 144).
-spec pretty_type(pprint@decoder:type(), config()) -> glam@doc:document().
pretty_type(Value, Config) ->
    case Value of
        {t_string, S} ->
            pretty_string(S, Config);

        {t_int, I} ->
            _pipe = erlang:integer_to_binary(I),
            ansi(_pipe, <<"\x{001b}[38;5;3m"/utf8>>, Config);

        {t_float, F} ->
            _pipe@1 = gleam_stdlib:float_to_string(F),
            ansi(_pipe@1, <<"\x{001b}[38;5;3m"/utf8>>, Config);

        {t_bool, B} ->
            _pipe@2 = gleam@bool:to_string(B),
            ansi(_pipe@2, <<"\x{001b}[38;5;4m"/utf8>>, Config);

        {t_bit_array, B@1} ->
            case erlang:element(3, Config) of
                keep_bit_arrays ->
                    pretty_bit_array(B@1, Config);

                bit_arrays_as_string ->
                    case gleam@bit_array:to_string(B@1) of
                        {ok, S@1} ->
                            pretty_string(S@1, Config);

                        {error, nil} ->
                            pretty_bit_array(B@1, Config)
                    end
            end;

        t_nil ->
            ansi(<<"Nil"/utf8>>, <<"\x{001b}[38;5;4m"/utf8>>, Config);

        {t_list, Items} ->
            pretty_list(Items, Config);

        {t_dict, D} ->
            pretty_dict(D, Config);

        {t_tuple, Items@1} ->
            pretty_tuple(Items@1, Config);

        {t_custom, Name, Fields} ->
            pretty_custom_type(Name, Fields, Config);

        {t_foreign, F@1} ->
            ansi(F@1, <<"\x{001b}[2m"/utf8>>, Config)
    end.

-file("src/pprint.gleam", 135).
?DOC(
    " Pretty print a value as a string with a custom config.\n"
    "\n"
    " # Examples\n"
    "\n"
    " ```\n"
    " [1, 2, 3, 4]\n"
    " |> pprint.with_config(Config(Styled, KeepBitArrays, Labels))\n"
    " ```\n"
).
-spec with_config(any(), config()) -> binary().
with_config(Value, Config) ->
    _pipe = Value,
    _pipe@1 = pprint_ffi:from(_pipe),
    _pipe@2 = pretty_dynamic(_pipe@1, Config),
    glam@doc:to_string(_pipe@2, 40).

-file("src/pprint.gleam", 89).
?DOC(
    " Pretty print a value with the config below to stderr for debugging purposes.\n"
    " The value is returned back from the function so it can be used in pipelines.\n"
    "\n"
    " ```\n"
    " Config(Styled, KeepBitArrays, Labels)\n"
    " ```\n"
    "\n"
    " # Examples\n"
    "\n"
    " ```\n"
    " pprint.debug([1, 2, 3])\n"
    " |> list.each(pprint.debug)\n"
    "\n"
    " // Prints:\n"
    " // [1, 2, 3]\n"
    " // 1\n"
    " // 2\n"
    " // 3\n"
    " ```\n"
).
-spec debug(KKA) -> KKA.
debug(Value) ->
    _pipe = Value,
    _pipe@1 = with_config(_pipe, {config, styled, keep_bit_arrays, labels}),
    gleam_stdlib:println_error(_pipe@1),
    Value.

-file("src/pprint.gleam", 104).
?DOC(
    " Pretty print a value as a string with the following config:\n"
    " ```\n"
    " Config(Unstyled, BitArraysAsString, NoLabels)\n"
    " ```\n"
    " This function behaves identically on both targets so it can be relied upon\n"
    " for snapshot testing.\n"
).
-spec format(any()) -> binary().
format(Value) ->
    with_config(Value, {config, unstyled, bit_arrays_as_string, no_labels}).

-file("src/pprint.gleam", 118).
?DOC(
    " Pretty print a value as a string with the following config:\n"
    " ```\n"
    " Config(Styled, BitArraysAsString, NoLabels)\n"
    " ```\n"
    " This function behaves identically on both targets.\n"
    "\n"
    " > ⚠️ **WARNING:** Styling is subject to change *without* a major release!\n"
    " This means that this function should only be used for debugging purposes and\n"
    " *should not* be used in tests.\n"
).
-spec styled(any()) -> binary().
styled(Value) ->
    with_config(Value, {config, styled, bit_arrays_as_string, no_labels}).

-file("src/pprint.gleam", 195).
-spec pretty_list(list(gleam@dynamic:dynamic_()), config()) -> glam@doc:document().
pretty_list(Items, Config) ->
    Items@1 = gleam@list:map(Items, fun pprint@decoder:classify/1),
    Space = case Items@1 of
        [{t_int, _} | _] ->
            {flex_break, <<" "/utf8>>, <<""/utf8>>};

        [{t_float, _} | _] ->
            {flex_break, <<" "/utf8>>, <<""/utf8>>};

        _ ->
            {break, <<" "/utf8>>, <<""/utf8>>}
    end,
    _pipe = gleam@list:map(
        Items@1,
        fun(_capture) -> pretty_type(_capture, Config) end
    ),
    comma_list_space(
        _pipe,
        glam@doc:from_string(<<"["/utf8>>),
        glam@doc:from_string(<<"]"/utf8>>),
        Space
    ).

-file("src/pprint.gleam", 209).
-spec pretty_dict(
    gleam@dict:dict(pprint@decoder:type(), pprint@decoder:type()),
    config()
) -> glam@doc:document().
pretty_dict(D, Config) ->
    _pipe = maps:to_list(D),
    _pipe@1 = gleam@list:sort(
        _pipe,
        fun(One_field, Other_field) ->
            {One_key, _} = One_field,
            {Other_key, _} = Other_field,
            gleam@string:compare(
                gleam@string:inspect(One_key),
                gleam@string:inspect(Other_key)
            )
        end
    ),
    _pipe@3 = gleam@list:map(
        _pipe@1,
        fun(Field) ->
            _pipe@2 = [pretty_type(erlang:element(1, Field), Config),
                pretty_type(erlang:element(2, Field), Config)],
            comma_list(
                _pipe@2,
                glam@doc:from_string(<<"#("/utf8>>),
                glam@doc:from_string(<<")"/utf8>>)
            )
        end
    ),
    comma_list(
        _pipe@3,
        glam@doc:from_string(<<"dict.from_list(["/utf8>>),
        glam@doc:from_string(<<"])"/utf8>>)
    ).

-file("src/pprint.gleam", 230).
-spec pretty_custom_type(binary(), list(pprint@decoder:field()), config()) -> glam@doc:document().
pretty_custom_type(Name, Fields, Config) ->
    Style = case Name of
        <<"Ok"/utf8>> ->
            <<"\x{001b}[1m"/utf8>>;

        <<"Error"/utf8>> ->
            <<"\x{001b}[1m"/utf8>>;

        <<"Some"/utf8>> ->
            <<"\x{001b}[1m"/utf8>>;

        <<"None"/utf8>> ->
            <<"\x{001b}[1m"/utf8>>;

        _ ->
            <<""/utf8>>
    end,
    Fields@1 = gleam@list:map(
        Fields,
        fun(Field) -> case {Field, erlang:element(4, Config)} of
                {{positional, Value}, labels} ->
                    pretty_dynamic(Value, Config);

                {{positional, Value}, no_labels} ->
                    pretty_dynamic(Value, Config);

                {{labelled, _, Value}, no_labels} ->
                    pretty_dynamic(Value, Config);

                {{labelled, Label, Value@1}, labels} ->
                    glam@doc:concat(
                        [ansi(
                                <<Label/binary, ": "/utf8>>,
                                <<"\x{001b}[2m"/utf8>>,
                                Config
                            ),
                            pretty_dynamic(Value@1, Config)]
                    )
            end end
    ),
    Name@1 = ansi(Name, Style, Config),
    Open = glam@doc:concat([Name@1, glam@doc:from_string(<<"("/utf8>>)]),
    Close = glam@doc:from_string(<<")"/utf8>>),
    case Fields@1 of
        [] ->
            Name@1;

        [Single] ->
            glam@doc:concat([Open, Single, Close]);

        _ ->
            _pipe = Fields@1,
            comma_list(_pipe, Open, Close)
    end.
