from itertools import permutations
def tsp_brute_force(distance_matrix, start_city):
    num_cities = len(distance_matrix)
    cities = [i for i in range(num_cities) if i != start_city]
    min_cost = float('inf')
    best_path = None
    for perm in permutations(cities):
        current_path = [start_city] + list(perm) + [start_city]
        current_cost = 0
        for i in range(len(current_path) - 1):
            current_cost += distance_matrix[current_path[i]][current_path[i+1]]
        if current_cost < min_cost:
            min_cost = current_cost
            best_path = current_path
    return min_cost, best_path
distance_matrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]
start_city = 0
min_cost, best_path = tsp_brute_force(distance_matrix, start_city)
print("Minimum Cost:", min_cost)
print("Best Path:", best_path)
