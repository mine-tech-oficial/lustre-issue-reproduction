-record(setup_function, {
    label :: binary(),
    setup_function :: fun((any()) -> fun((any()) -> any()))
}).
