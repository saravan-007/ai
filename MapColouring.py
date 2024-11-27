def is_valid_coloring(region, color, coloring, neighbors):
    """Check if the coloring is valid for the given region."""
    for neighbor in neighbors[region]:
        if coloring.get(neighbor) == color:
            return False
    return True


def map_coloring(region_list, colors, neighbors, coloring):
    """Solve the map coloring problem using backtracking."""
    # If all regions are colored, return the solution
    if len(coloring) == len(region_list):
        return coloring

    # Select the next region to color
    for region in region_list:
        if region not in coloring:
            for color in colors:
                if is_valid_coloring(region, color, coloring, neighbors):
                    coloring[region] = color  # Assign the color
                    result = map_coloring(region_list, colors, neighbors, coloring)
                    if result:  # If solution found, return it
                        return result
                    # Backtrack
                    del coloring[region]
            return None
    return None


def main():
    # List of regions
    regions = ["A", "B", "C", "D", "E"]

    # Available colors
    colors = ["Red", "Green", "Blue"]

    # Adjacency list defining neighbors
    neighbors = {
        "A": ["B", "C"],
        "B": ["A", "C", "D"],
        "C": ["A", "B", "D", "E"],
        "D": ["B", "C", "E"],
        "E": ["C", "D"]
    }

    # Solve the problem
    solution = map_coloring(regions, colors, neighbors, {})
    
    # Print the result
    if solution:
        print("Solution Found:")
        for region, color in solution.items():
            print(f"Region {region} → {color}")
    else:
        print("No solution found.")

if __name__ == "__main__":
    main()
