% Facts: Diet recommendations for specific diseases
diet(diabetes, 'Low sugar, high fiber, and whole-grain foods').
diet(hypertension, 'Low sodium, high potassium, and whole foods').
diet(obesity, 'Low calorie, high protein, and nutrient-dense foods').
diet(heart_disease, 'Low saturated fat, omega-3 rich foods, and whole grains').
diet(anemia, 'Iron-rich foods like spinach, red meat, and legumes').
diet(kidney_disease, 'Low sodium, potassium, and phosphorus foods').
diet(gout, 'Low purine foods, avoid red meat, and drink plenty of water').
diet(celiac, 'Gluten-free foods like rice, quinoa, and corn').
diet(constipation, 'High fiber foods, fruits, vegetables, and plenty of water').
diet(malnutrition, 'Balanced diet with proteins, carbs, and vitamins').

% Rules: Provide suggestions
suggest_diet(Disease, Recommendation) :-
    diet(Disease, Recommendation).

% Example queries:
% - What is the diet suggestion for diabetes? ?- suggest_diet(diabetes, R).
% - What is the diet for heart disease? ?- suggest_diet(heart_disease, R).
