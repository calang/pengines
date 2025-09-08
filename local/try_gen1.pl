:- use_module(library(pengines)).

run(X, Y) :-
    pengine_rpc(
        'http://localhost:3030',
        % (
        %     current_pengine_application(X),
        %     X = Y
        % ),
        ancestor_decendant(X, Y),
        [application(genealogist)]
    ).
