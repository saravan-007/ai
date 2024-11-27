% Facts: Defining diseases and associated symptoms
disease(flu).
disease(cold).
disease(covid).

symptom(flu, fever).
symptom(flu, cough).
symptom(flu, headache).
symptom(flu, sore_throat).

symptom(cold, cough).
symptom(cold, runny_nose).
symptom(cold, sneezing).

symptom(covid, fever).
symptom(covid, cough).
symptom(covid, difficulty_breathing).
symptom(covid, sore_throat).

% Rule to diagnose a disease based on the symptoms
diagnose(Disease) :-
    disease(Disease),
    symptoms(Disease, Symptoms),
    ask_for_symptoms(Symptoms).

% Rule to check if the patient has the symptoms for a disease
symptoms(Disease, Symptoms) :-
    findall(Symptom, symptom(Disease, Symptom), Symptoms).

% Ask the user about the symptoms
ask_for_symptoms([]).
ask_for_symptoms([Symptom | Rest]) :-
    ask(Symptom),
    ask_for_symptoms(Rest).

% Ask the user if they have the symptom
ask(Symptom) :-
    format('Do you have ~w? (yes/no): ', [Symptom]),
    read(Response),
    (Response == yes -> true; false).

% To run the program
start_diagnosis :-
    write('Starting the diagnosis process...'), nl,
    diagnose(Disease),
    format('You may have: ~w', [Disease]), nl.
