from itertools import permutations

def solve_cryptarithmetic(words, result):
    # Extract all unique letters from the words and the result
    unique_letters = set("".join(words) + result)

    # Ensure the number of unique letters doesn't exceed 10 (0-9 digits)
    if len(unique_letters) > 10:
        print("Too many unique letters for digits.")
        return

    # Solve the cryptarithmetic puzzle using permutations
    for perm in permutations(range(10), len(unique_letters)):
        # Map letters to digits
        mapping = dict(zip(unique_letters, perm))

        # Reconstruct the words as numbers
        word_values = []
        for word in words:
            if mapping[word[0]] == 0:  # Check for leading zeros
                break
            value = int("".join(str(mapping[letter]) for letter in word))
            word_values.append(value)
        else:
            # Convert the result into a number
            if mapping[result[0]] != 0:  # Check for leading zeros
                result_value = int("".join(str(mapping[letter]) for letter in result))
                if sum(word_values) == result_value:
                    print("Solution found:")
                    for i, word in enumerate(words):
                        print(f"{word}: {word_values[i]}")
                    print(f"{result}: {result_value}")
                    return

    print("No solution exists.")

def main():
    # Manual input for the problem
    print("Enter the cryptarithmetic problem:")
    num_words = int(input("Enter the number of words to add: "))
    words = []
    for i in range(num_words):
        words.append(input(f"Enter word {i + 1}: ").upper())
    result = input("Enter the result word: ").upper()

    solve_cryptarithmetic(words, result)

if __name__ == "__main__":
    main()
