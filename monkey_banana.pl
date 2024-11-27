% Declare predicates as dynamic to allow modification
:- dynamic on_floor/1.
:- dynamic is_grasped/2.
:- dynamic is_holding/2.

% Define the initial facts
on_floor(monkey).         % The monkey starts on the floor
on_floor(banana).         % The banana starts on the floor
is_grasped(banana, false). % Initially, the banana is not grasped
is_holding(monkey, false).% The monkey is not holding the banana initially

% Define actions
move_up(monkey) :-         % The monkey moves up to the platform
    on_floor(monkey),      % The monkey must be on the floor
    retract(on_floor(monkey)), % Remove monkey from the floor
    assert(on_floor(platform)), % Add monkey to the platform
    write('The monkey is now on the platform.'), nl.

move_down(monkey) :-       % The monkey moves down to the floor
    on_floor(platform),    % The monkey must be on the platform
    retract(on_floor(platform)), % Remove monkey from the platform
    assert(on_floor(monkey)), % Add monkey back to the floor
    write('The monkey is now on the floor again.'), nl.

grasp_banana :-            % The monkey grasps the banana
    on_floor(monkey),      % The monkey must be on the floor
    on_floor(banana),      % The banana must be on the floor
    retract(is_grasped(banana, false)), % Change banana status
    assert(is_grasped(banana, true)),  % The banana is now grasped
    write('The monkey has grasped the banana.'), nl.

% Plan to get the banana
plan :-
    on_floor(monkey),      % The monkey must be on the floor
    on_floor(banana),      % The banana must be on the floor
    is_holding(monkey, false), % The monkey should not be holding the banana yet
    move_up(monkey),       % Move the monkey up to the platform
    grasp_banana,          % Grasp the banana
    write('The monkey successfully got the banana!'), nl.
