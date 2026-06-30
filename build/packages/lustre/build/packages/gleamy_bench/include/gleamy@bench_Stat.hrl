-record(stat, {
    name :: binary(),
    calculate :: fun((gleamy@bench:set()) -> float())
}).
