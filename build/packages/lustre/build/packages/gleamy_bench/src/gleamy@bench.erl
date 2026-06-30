-module(gleamy@bench).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([now/0, run/3, do_repeat/3, repeat/2, table/2]).
-export_type([input/1, function_/2, set/0, stat/0, option/0, options/0, bench_results/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

-type input(EZK) :: {input, binary(), EZK}.

-type function_(EZL, EZM) :: {function, binary(), fun((EZL) -> EZM)} |
    {setup_function, binary(), fun((EZL) -> fun((EZL) -> EZM))}.

-type set() :: {set, binary(), binary(), list(float())}.

-type stat() :: {p, integer()} |
    ips |
    min |
    max |
    mean |
    sd |
    sd_percent |
    {stat, binary(), fun((set()) -> float())}.

-type option() :: {warmup, integer()} |
    {duration, integer()} |
    {decimals, integer()} |
    quiet.

-type options() :: {options, integer(), integer(), integer(), boolean()}.

-type bench_results() :: {bench_results, options(), list(set())}.

-file("src/gleamy/bench.gleam", 14).
?DOC(" timestamp in milliseconds\n").
-spec now() -> float().
now() ->
    Ns = os:perf_counter(1000000000),
    erlang:float(Ns) / 1000000.0.

-file("src/gleamy/bench.gleam", 43).
-spec mean(list(float())) -> float().
mean(Data) ->
    Count = erlang:float(erlang:length(Data)),
    case Count of
        +0.0 -> +0.0;
        -0.0 -> -0.0;
        Gleam@denominator -> gleam@float:sum(Data) / Gleam@denominator
    end.

-file("src/gleamy/bench.gleam", 48).
-spec standard_deviation(list(float())) -> float().
standard_deviation(Data) ->
    Count = erlang:float(erlang:length(Data)),
    Mean = mean(Data),
    _assert_subject = begin
        _pipe = (case Count of
            +0.0 -> +0.0;
            -0.0 -> -0.0;
            Gleam@denominator -> gleam@float:sum(
                gleam@list:map(
                    Data,
                    fun(X) ->
                        Y = X - Mean,
                        Y * Y
                    end
                )
            )
            / Gleam@denominator
        end),
        gleam@float:square_root(_pipe)
    end,
    {ok, Value} = case _assert_subject of
        {ok, _} -> _assert_subject;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"gleamy/bench"/utf8>>,
                        function => <<"standard_deviation"/utf8>>,
                        line => 51})
    end,
    Value.

-file("src/gleamy/bench.gleam", 65).
-spec min(list(float())) -> float().
min(Data) ->
    First = case Data of
        [X | _] ->
            X;

        _ ->
            +0.0
    end,
    gleam@list:fold(Data, First, fun(A, X@1) -> gleam@float:min(A, X@1) end).

-file("src/gleamy/bench.gleam", 73).
-spec percentile(integer(), list(float())) -> float().
percentile(N, Data) ->
    Data@1 = begin
        _pipe = Data,
        _pipe@1 = gleam@list:sort(_pipe, fun gleam@float:compare/2),
        gleam@list:drop(_pipe@1, (N * erlang:length(Data)) div 100)
    end,
    case Data@1 of
        [X | _] ->
            X;

        _ ->
            +0.0
    end.

-file("src/gleamy/bench.gleam", 84).
-spec max(list(float())) -> float().
max(Data) ->
    First = case Data of
        [X | _] ->
            X;

        _ ->
            +0.0
    end,
    gleam@list:fold(Data, First, fun(A, X@1) -> gleam@float:max(A, X@1) end).

-file("src/gleamy/bench.gleam", 92).
-spec do_repeat_until(list(float()), float(), EZU, fun((EZU) -> any())) -> list(float()).
do_repeat_until(Acc, Stop, Value, Fun) ->
    Start = now(),
    _ = Fun(Value),
    End = now(),
    case End of
        _ when End < Stop ->
            do_repeat_until([End - Start | Acc], Stop, Value, Fun);

        _ ->
            Acc
    end.

-file("src/gleamy/bench.gleam", 107).
-spec repeat_until(float(), EZX, fun((EZX) -> any())) -> list(float()).
repeat_until(Duration, Value, Fun) ->
    do_repeat_until([], now() + Duration, Value, Fun).

-file("src/gleamy/bench.gleam", 126).
-spec default_options() -> options().
default_options() ->
    {options, 500, 2000, 4, false}.

-file("src/gleamy/bench.gleam", 130).
-spec apply_options(options(), list(option())) -> options().
apply_options(Default, Options) ->
    case Options of
        [] ->
            Default;

        [X | Xs] ->
            case X of
                {warmup, Ms} ->
                    apply_options(
                        begin
                            _record = Default,
                            {options,
                                Ms,
                                erlang:element(3, _record),
                                erlang:element(4, _record),
                                erlang:element(5, _record)}
                        end,
                        Xs
                    );

                {duration, Ms@1} ->
                    apply_options(
                        begin
                            _record@1 = Default,
                            {options,
                                erlang:element(2, _record@1),
                                Ms@1,
                                erlang:element(4, _record@1),
                                erlang:element(5, _record@1)}
                        end,
                        Xs
                    );

                {decimals, N} ->
                    apply_options(
                        begin
                            _record@2 = Default,
                            {options,
                                erlang:element(2, _record@2),
                                erlang:element(3, _record@2),
                                N,
                                erlang:element(5, _record@2)}
                        end,
                        Xs
                    );

                quiet ->
                    apply_options(
                        begin
                            _record@3 = Default,
                            {options,
                                erlang:element(2, _record@3),
                                erlang:element(3, _record@3),
                                erlang:element(4, _record@3),
                                true}
                        end,
                        Xs
                    )
            end
    end.

-file("src/gleamy/bench.gleam", 143).
-spec run(list(input(FAB)), list(function_(FAB, any())), list(option())) -> bench_results().
run(Inputs, Functions, Options) ->
    Options@1 = apply_options(default_options(), Options),
    Results = gleam@list:flat_map(
        Inputs,
        fun(Input) ->
            {input, Input_label, Input@1} = Input,
            gleam@list:map(Functions, fun(Function) -> case Function of
                        {function, Fun_label, Fun} ->
                            case erlang:element(5, Options@1) of
                                true ->
                                    nil;

                                false ->
                                    gleam_stdlib:println(
                                        <<<<<<"benching set "/utf8,
                                                    Input_label/binary>>/binary,
                                                " "/utf8>>/binary,
                                            Fun_label/binary>>
                                    )
                            end,
                            _ = repeat_until(
                                erlang:float(erlang:element(2, Options@1)),
                                Input@1,
                                Fun
                            ),
                            Timings = repeat_until(
                                erlang:float(erlang:element(3, Options@1)),
                                Input@1,
                                Fun
                            ),
                            {set, Input_label, Fun_label, Timings};

                        {setup_function, Fun_label@1, Setup_fun} ->
                            case erlang:element(5, Options@1) of
                                true ->
                                    nil;

                                false ->
                                    gleam_stdlib:println(
                                        <<<<<<"benching set "/utf8,
                                                    Input_label/binary>>/binary,
                                                " "/utf8>>/binary,
                                            Fun_label@1/binary>>
                                    )
                            end,
                            Fun@1 = Setup_fun(Input@1),
                            _ = repeat_until(
                                erlang:float(erlang:element(2, Options@1)),
                                Input@1,
                                Fun@1
                            ),
                            Timings@1 = repeat_until(
                                erlang:float(erlang:element(3, Options@1)),
                                Input@1,
                                Fun@1
                            ),
                            {set, Input_label, Fun_label@1, Timings@1}
                    end end)
        end
    ),
    {bench_results, Options@1, Results}.

-file("src/gleamy/bench.gleam", 182).
-spec do_repeat(integer(), FAJ, fun((FAJ) -> any())) -> nil.
do_repeat(N, Input, Fun) ->
    case N of
        0 ->
            nil;

        _ ->
            _ = Fun(Input),
            do_repeat(N - 1, Input, Fun)
    end.

-file("src/gleamy/bench.gleam", 192).
-spec repeat(integer(), fun((FAM) -> any())) -> fun((FAM) -> nil).
repeat(N, Fun) ->
    fun(Input) -> do_repeat(N, Input, Fun) end.

-file("src/gleamy/bench.gleam", 200).
-spec format_float(float(), integer()) -> binary().
format_float(F, Decimals) ->
    _assert_subject = gleam@int:power(10, erlang:float(Decimals)),
    {ok, Factor} = case _assert_subject of
        {ok, _} -> _assert_subject;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"gleamy/bench"/utf8>>,
                        function => <<"format_float"/utf8>>,
                        line => 201})
    end,
    Whole = erlang:trunc(F),
    Decimal = erlang:trunc(F * Factor) - (Whole * erlang:trunc(Factor)),
    gleam@string:concat(
        [gleam@string:pad_start(
                erlang:integer_to_binary(Whole),
                (14 - Decimals) - 1,
                <<" "/utf8>>
            ),
            <<"."/utf8>>,
            gleam@string:pad_start(
                erlang:integer_to_binary(Decimal),
                Decimals,
                <<"0"/utf8>>
            )]
    ).

-file("src/gleamy/bench.gleam", 211).
-spec header_row(list(stat())) -> binary().
header_row(Stats) ->
    _pipe = [gleam@string:pad_end(<<"Input"/utf8>>, 20, <<" "/utf8>>),
        gleam@string:pad_end(<<"Function"/utf8>>, 20, <<" "/utf8>>) |
        gleam@list:map(
            Stats,
            fun(Stat) ->
                Stat@1 = case Stat of
                    {p, N} ->
                        <<"P"/utf8, (erlang:integer_to_binary(N))/binary>>;

                    ips ->
                        <<"IPS"/utf8>>;

                    min ->
                        <<"Min"/utf8>>;

                    max ->
                        <<"Max"/utf8>>;

                    mean ->
                        <<"Mean"/utf8>>;

                    sd ->
                        <<"SD"/utf8>>;

                    sd_percent ->
                        <<"SD%"/utf8>>;

                    {stat, Name, _} ->
                        Name
                end,
                gleam@string:pad_start(Stat@1, 14, <<" "/utf8>>)
            end
        )],
    gleam@string:join(_pipe, <<""/utf8>>).

-file("src/gleamy/bench.gleam", 232).
-spec stat_row(set(), list(stat()), options()) -> binary().
stat_row(Set, Stats, Options) ->
    _pipe@2 = [gleam@string:pad_end(erlang:element(2, Set), 20, <<" "/utf8>>),
        gleam@string:pad_end(erlang:element(3, Set), 20, <<" "/utf8>>) |
        gleam@list:map(
            Stats,
            fun(Stat) ->
                Stat@1 = case Stat of
                    {p, N} ->
                        percentile(N, erlang:element(4, Set));

                    ips ->
                        case gleam@float:sum(erlang:element(4, Set)) of
                            +0.0 -> +0.0;
                            -0.0 -> -0.0;
                            Gleam@denominator -> 1000.0 * erlang:float(
                                erlang:length(erlang:element(4, Set))
                            )
                            / Gleam@denominator
                        end;

                    min ->
                        min(erlang:element(4, Set));

                    max ->
                        max(erlang:element(4, Set));

                    mean ->
                        mean(erlang:element(4, Set));

                    sd ->
                        standard_deviation(erlang:element(4, Set));

                    sd_percent ->
                        case mean(erlang:element(4, Set)) of
                            +0.0 -> +0.0;
                            -0.0 -> -0.0;
                            Gleam@denominator@1 -> 100.0 * standard_deviation(
                                erlang:element(4, Set)
                            )
                            / Gleam@denominator@1
                        end;

                    {stat, _, Calc} ->
                        Calc(Set)
                end,
                _pipe = Stat@1,
                _pipe@1 = format_float(_pipe, erlang:element(4, Options)),
                gleam@string:pad_start(_pipe@1, 14, <<" "/utf8>>)
            end
        )],
    gleam@string:join(_pipe@2, <<""/utf8>>).

-file("src/gleamy/bench.gleam", 256).
-spec table(bench_results(), list(stat())) -> binary().
table(Result, Stats) ->
    Header = header_row(Stats),
    Body = gleam@list:map(
        erlang:element(3, Result),
        fun(_capture) ->
            stat_row(_capture, Stats, erlang:element(2, Result))
        end
    ),
    _pipe = [Header | Body],
    gleam@string:join(_pipe, <<"\n"/utf8>>).
