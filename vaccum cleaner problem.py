
class VacuumCleaner:
    def __init__(self, grid, start_position):
        self.grid = grid
        self.position = start_position
        self.cleaned_cells = 0

    def clean(self):
        x, y = self.position
        if self.grid[x][y] == 1:
            self.grid[x][y] = 0
            self.cleaned_cells += 1

    def move(self, direction):
        x, y = self.position
        if direction == 'UP' and x > 0:
            self.position = (x - 1, y)
        elif direction == 'DOWN' and x < len(self.grid) - 1:
            self.position = (x + 1, y)
        elif direction == 'LEFT' and y > 0:
            self.position = (x, y - 1)
        elif direction == 'RIGHT' and y < len(self.grid[0]) - 1:
            self.position = (x, y + 1)

    def start_cleaning(self, movements):
        for move in movements:
            self.clean()
            self.move(move)
        self.clean()

# Define the grid and start position
grid = [
    [1, 1, 0, 1],
    [0, 1, 1, 0],
    [1, 0, 1, 1],
    [1, 1, 1, 0]
]

start_position = (0, 0)

# Create VacuumCleaner instance and define movements
vacuum = VacuumCleaner(grid, start_position)
movements = ['RIGHT', 'DOWN', 'DOWN', 'LEFT', 'UP', 'UP', 'RIGHT', 'RIGHT', 'DOWN']

# Start cleaning
vacuum.start_cleaning(movements)

print("Cleaned cells:", vacuum.cleaned_cells)
print("Final grid state:")
for row in grid:
    print(row)
