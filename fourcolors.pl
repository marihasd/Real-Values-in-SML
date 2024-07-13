
% Submitted 4 May 2024 8:15pm
% Four-color Map Problem Solver for South America
%
% This Prolog program solves the classic "Four-color Map Problem" for the countries of South America.
% The objective is to color each country on a map of South America using one of four colors (red, green, blue, yellow)
% such that no two adjacent countries have the same color.
%
% The program defines the countries of South America and their borders, then assigns colors to each country
% while ensuring that neighboring countries have different colors.
%
% To use this program:
% 1. Define the countries and their borders using the `country/1` and `border/2` predicates.
% 2. Define the available colors using the `color/1` predicate.
% 3. Run the `main` predicate. This will assign colors to the countries and print the valid coloring.
%
% Example usage:
%   ?- main.
%
% This program demonstrates the power of Prolog's backtracking mechanism to efficiently explore
% different color assignments until a valid solution is found.


% Define the countries
country(argentina).
country(bolivia).
country(brazil).
country(chile).
country(colombia).
country(ecuador).
country(guyana).
country(paraguay).
country(peru).
country(suriname).
country(uruguay).
country(venezuela).

% Define the borders
border(brazil, venezuela).
border(brazil, guyana).
border(brazil, suriname).
border(brazil, french_guiana).
border(brazil, colombia).
border(brazil, peru).
border(brazil, bolivia).
border(brazil, paraguay).
border(brazil, argentina).
border(brazil, uruguay).
border(brazil, chile).

border(venezuela, guyana).
border(venezuela, suriname).
border(venezuela, brazil).
border(venezuela, colombia).

border(guyana, venezuela).
border(guyana, suriname).
border(guyana, brazil).

border(suriname, guyana).
border(suriname, french_guiana).
border(suriname, brazil).

border(french_guiana, suriname).
border(french_guiana, brazil).

border(colombia, venezuela).
border(colombia, brazil).
border(colombia, peru).
border(colombia, ecuador).

border(peru, ecuador).
border(peru, colombia).
border(peru, brazil).
border(peru, bolivia).
border(peru, chile).

border(bolivia, peru).
border(bolivia, brazil).
border(bolivia, paraguay).
border(bolivia, argentina).
border(bolivia, chile).

border(paraguay, brazil).
border(paraguay, bolivia).
border(paraguay, argentina).

border(argentina, chile).
border(argentina, bolivia).
border(argentina, paraguay).
border(argentina, brazil).
border(argentina, uruguay).

border(uruguay, argentina).
border(uruguay, brazil).

border(chile, peru).
border(chile, bolivia).
border(chile, argentina).

% Define colors
color(red).
color(green).
color(blue).
color(yellow).

% Ensure that a list contains only unique elements
all_different([]).
all_different([_]).
all_different([H|T]) :- not(member(H,T)), all_different(T).

% Assign colors to countries
assign_colors([]).
assign_colors([Country-Color|Rest]) :-
    color(Color),
    assign_colors(Rest),
    \+ (border(Country, Neighbor), member(Neighbor-Color, Rest)).

% Define the main predicate
main :-
    % Assign colors to countries
    findall(Country-Color, country(Country), Countries),
    assign_colors(Countries),

    % Print the valid coloring
    write('Four-color Map Problem - South America'), nl,
    write('---------------------------------------'), nl,
    write('Country \t Color'), nl,
    write('--------------------------'), nl,
    forall(member(Country-Color, Countries), (
        write(Country), write('\t\t '), write(Color), nl
    )),
    write('--------------------------'), nl,
    write('End of program.'), nl.
