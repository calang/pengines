% first example
% from https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/pengines.html%27)

:- use_module(library(pengines)).

run(X, Y) :-
    pengine_rpc(
        'http://localhost:3030',
        % (
        %     current_pengine_application(X),
        %     X = Y
        % ),
        ancestor_descendant(X, Y),
        [application(genealogist)]
    ).
