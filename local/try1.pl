:- use_module(library(pengines)).

run :-
    pengine_create([
        % server is not required for local pengines; port 3030 is default
        % server('http://localhost:3030'),   % port is required, unless 80 or 443
        src_text("
            q(X) :- p(X).
            p(a). p(b). p(c).
        ")
    ]),
    pengine_event_loop(handle, []).


handle(create(ID, _)) :-
    format('Pengine created: ~w~n', [ID]),
    pengine_ask(ID, q(_X), []).
handle(success(_ID, [X], false)) :-
    format('Last result: ~w~n', [X]),
    writeln(X).
handle(success(ID, [X], true)) :-
    format('With more results: ~w~n', [X]),
    writeln(X),
    pengine_next(ID, []).
handle(error(_ID, Error)) :-
    format('Error: ~w~n', [Error]).

