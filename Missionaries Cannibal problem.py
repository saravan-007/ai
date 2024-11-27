from collections import deque

# Check if a state is valid
def is_valid_state(m_left, c_left, m_right, c_right):
    # Check missionaries are not outnumbered by cannibals on either bank
    if (m_left < c_left and m_left > 0) or (m_right < c_right and m_right > 0):
        return False
    # Check values are within valid range
    if m_left < 0 or c_left < 0 or m_right < 0 or c_right < 0:
        return False
    return True

# Generate all possible next states
def get_next_states(state):
    m_left, c_left, boat = state
    m_right = 3 - m_left
    c_right = 3 - c_left

    # Define possible moves
    moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]
    next_states = []

    for m_move, c_move in moves:
        if boat == 1:  # Boat on the left bank
            new_state = (m_left - m_move, c_left - c_move, 0)
        else:  # Boat on the right bank
            new_state = (m_left + m_move, c_left + c_move, 1)

        m_new, c_new, b_new = new_state
        if is_valid_state(m_new, c_new, 3 - m_new, 3 - c_new):
            next_states.append(new_state)

    return next_states

# Solve the problem using BFS
def solve_missionaries_cannibals():
    initial_state = (3, 3, 1)  # (M_left, C_left, Boat position)
    goal_state = (0, 0, 0)    # (M_left, C_left, Boat position)
    queue = deque([(initial_state, [])])  # Queue holds (state, path)
    visited = set()

    while queue:
        current_state, path = queue.popleft()

        # If we reached the goal state, return the solution path
        if current_state == goal_state:
            return path + [current_state]

        # Skip already visited states
        if current_state in visited:
            continue
        visited.add(current_state)

        # Explore next states
        for next_state in get_next_states(current_state):
            queue.append((next_state, path + [current_state]))

    return "No solution"

# Run the algorithm and print the solution
solution = solve_missionaries_cannibals()
if solution != "No solution":
    for step in solution:
        print(f"Left: M={step[0]} C={step[1]}, Right: M={3 - step[0]} C={3 - step[1]}, Boat: {'Left' if step[2] == 1 else 'Right'}")
else:
    print(solution)
