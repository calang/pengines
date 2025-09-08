:- use_module(library(pengines)).

assert_mother_child(Mother, Child) :-
    pengine_rpc(
        'http://localhost:3030',
        assert_mother_child(Mother, Child),
        [application(genealogist)]
    ).

mother_child(Mother, Child) :-
    pengine_rpc(
        'http://localhost:3030',
        mother_child(Mother, Child),
        [application(genealogist)]
    ).

