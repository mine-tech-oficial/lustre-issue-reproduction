-module(pprint@decoder).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).
-define(FILEPATH, "src/pprint/decoder.gleam").
-export([classify/1]).
-export_type([type/0, field/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(false).

-type type() :: {t_string, binary()} |
    {t_int, integer()} |
    {t_float, float()} |
    {t_bool, boolean()} |
    t_nil |
    {t_bit_array, bitstring()} |
    {t_list, list(gleam@dynamic:dynamic_())} |
    {t_dict, gleam@dict:dict(type(), type())} |
    {t_tuple, list(gleam@dynamic:dynamic_())} |
    {t_custom, binary(), list(field())} |
    {t_foreign, binary()}.

-type field() :: {labelled, binary(), gleam@dynamic:dynamic_()} |
    {positional, gleam@dynamic:dynamic_()}.

-file("src/pprint/decoder.gleam", 61).
?DOC(false).
-spec custom_type() -> gleam@dynamic@decode:decoder(type()).
custom_type() ->
    gleam@dynamic@decode:new_primitive_decoder(
        <<"CustomType"/utf8>>,
        fun(Dynamic) ->
            gleam@result:replace_error(
                pprint_ffi:decode_custom_type(Dynamic),
                {t_custom, <<""/utf8>>, []}
            )
        end
    ).

-file("src/pprint/decoder.gleam", 55).
?DOC(false).
-spec tuple() -> gleam@dynamic@decode:decoder(list(gleam@dynamic:dynamic_())).
tuple() ->
    gleam@dynamic@decode:new_primitive_decoder(
        <<"Tuple"/utf8>>,
        fun(Dynamic) ->
            gleam@result:replace_error(pprint_ffi:decode_tuple(Dynamic), [])
        end
    ).

-file("src/pprint/decoder.gleam", 67).
?DOC(false).
-spec nil() -> gleam@dynamic@decode:decoder(nil).
nil() ->
    gleam@dynamic@decode:new_primitive_decoder(
        <<"Nil"/utf8>>,
        fun pprint_ffi:decode_nil/1
    ).

-file("src/pprint/decoder.gleam", 38).
?DOC(false).
-spec type_decoder() -> gleam@dynamic@decode:decoder(type()).
type_decoder() ->
    gleam@dynamic@decode:recursive(
        fun() ->
            gleam@dynamic@decode:one_of(
                gleam@dynamic@decode:map(
                    {decoder, fun gleam@dynamic@decode:decode_int/1},
                    fun(Field@0) -> {t_int, Field@0} end
                ),
                [gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_float/1},
                        fun(Field@0) -> {t_float, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_float/1},
                        fun(Field@0) -> {t_float, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_string/1},
                        fun(Field@0) -> {t_string, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_bool/1},
                        fun(Field@0) -> {t_bool, Field@0} end
                    ),
                    gleam@dynamic@decode:map(nil(), fun(_) -> t_nil end),
                    gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_bit_array/1},
                        fun(Field@0) -> {t_bit_array, Field@0} end
                    ),
                    custom_type(),
                    gleam@dynamic@decode:map(
                        tuple(),
                        fun(Field@0) -> {t_tuple, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        gleam@dynamic@decode:list(
                            {decoder, fun gleam@dynamic@decode:decode_dynamic/1}
                        ),
                        fun(Field@0) -> {t_list, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        gleam@dynamic@decode:dict(
                            type_decoder(),
                            type_decoder()
                        ),
                        fun(Field@0) -> {t_dict, Field@0} end
                    ),
                    gleam@dynamic@decode:map(
                        {decoder, fun gleam@dynamic@decode:decode_dynamic/1},
                        fun(Value) ->
                            {t_foreign, gleam@string:inspect(Value)}
                        end
                    )]
            )
        end
    ).

-file("src/pprint/decoder.gleam", 30).
?DOC(false).
-spec classify(gleam@dynamic:dynamic_()) -> type().
classify(Value) ->
    T@1 = case gleam@dynamic@decode:run(Value, type_decoder()) of
        {ok, T} -> T;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"pprint/decoder"/utf8>>,
                        function => <<"classify"/utf8>>,
                        line => 31,
                        value => _assert_fail,
                        start => 679,
                        'end' => 731,
                        pattern_start => 690,
                        pattern_end => 695})
    end,
    T@1.
