:- use_module(library(pengines)).

run(X) :-
    member(X, [a, b, c, d]),
    pengine_rpc(
        % 'https://pengines.swi-prolog.org',
        'http://localhost:3030',
        p(X),
        [
            src_list([p(b), p(c), p(d), p(e)]),
            timeout(5)
        ]
    ),
    member(X, [c, d, e, f]).


% X = c ;
% X = d.