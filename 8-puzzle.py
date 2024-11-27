from heapq import heappush, heappop

# Utility function to calculate Manhattan distance (heuristic)
def manhattan_distance(state, goal):
    distance = 0
    for i in range(1, 9):  # Exclude the blank tile (0)
        xi, yi = divmod(state.index(i), 3)
        xg, yg = divmod(goal.index(i), 3)
        distance += abs(xi - xg) + abs(yi - yg)
    return distance

# Function to generate neighbors of the current state
def get_neighbors(state):
    neighbors = []
    zero_index = state.index(0)
    x, y = divmod(zero_index, 3)

    # Possible moves: up, down, left, right
    moves = [(x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)]
    for nx, ny in moves:
        if 0 <= nx < 3 and 0 <= ny < 3:  # Valid move
            neighbor = state[:]
            swap_index = nx * 3 + ny
            neighbor[zero_index], neighbor[swap_index] = neighbor[swap_index], neighbor[zero_index]
            neighbors.append(neighbor)
    return neighbors

# A* algorithm to solve the puzzle
def solve_puzzle(start, goal):
    open_set = []
    heappush(open_set, (0 + manhattan_distance(start, goal), 0, start, []))
    visited = set()

    while open_set:
        _, cost, current, path = heappop(open_set)

        if current == goal:
            return path + [current]

        visited.add(tuple(current))

        for neighbor in get_neighbors(current):
            if tuple(neighbor) not in visited:
                new_cost = cost + 1
                heappush(open_set, (new_cost + manhattan_distance(neighbor, goal), new_cost, neighbor, path + [current]))

    return None  # No solution

# Helper function to print the puzzle state
def print_puzzle(state):
    for i in range(0, 9, 3):
        print(state[i:i + 3])
    print()

# Example usage
start_state = [1, 2, 3, 4, 0, 5, 6, 7, 8]  # Initial state
goal_state = [1, 2, 3, 4, 5, 6, 7, 8, 0]   # Goal state

solution = solve_puzzle(start_state, goal_state)
if solution:
    print("Solution found in {} steps:".format(len(solution) - 1))
    for step in solution:
        print_puzzle(step)
else:
    print("No solution exists.")
