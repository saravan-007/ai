% Facts: planet(Name, DistanceFromSunInAU, Type, Size, SupportsLife)
planet('Mercury', 0.39, 'Terrestrial', 'Small', no).
planet('Venus', 0.72, 'Terrestrial', 'Small', no).
planet('Earth', 1.00, 'Terrestrial', 'Small', yes).
planet('Mars', 1.52, 'Terrestrial', 'Small', no).
planet('Jupiter', 5.20, 'Gas Giant', 'Large', no).
planet('Saturn', 9.58, 'Gas Giant', 'Large', no).
planet('Uranus', 19.22, 'Ice Giant', 'Large', no).
planet('Neptune', 30.05, 'Ice Giant', 'Large', no).

% Rule to find planets closer to the sun than a given distance
closer_to_sun_than(Planet, Distance) :-
    planet(Planet, DistanceFromSun, _, _, _),
    DistanceFromSun < Distance.

% Rule to find planets of a specific type
planets_of_type(Type, Planet) :-
    planet(Planet, _, Type, _, _).

% Rule to check if a planet supports life
life_supporting_planet(Planet) :-
    planet(Planet, _, _, _, yes).

% Rule to find planets based on size
planets_by_size(Size, Planet) :-
    planet(Planet, _, _, Size, _).

% Rule to find planets farther than a given distance
farther_from_sun_than(Planet, Distance) :-
    planet(Planet, DistanceFromSun, _, _, _),
    DistanceFromSun > Distance.
