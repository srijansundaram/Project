import random

def get_random_word():
    words = ['python', 'hangman', 'challenge', 'programming', 'developer']
    return random.choice(words)

def display_word(word, guessed_letters):
    return ' '.join([letter if letter in guessed_letters else ' _' for letter in word])

def hangman():
    word = get_random_word()
    guessed_letters = set()
    tries = 6
    guessed_word = display_word(word, guessed_letters)
    name = input("Enter your name: ")

    print(f"{name}, Welcome to Hangman!")
    print(guessed_word)

    while tries>0 and '_' in guessed_word:
        guess = input("Guess a letter: ").lower()

        if len(guess) != 1 or not guessed_word:
            print("Invalid Input. Please enter a single letter.")
            continue

        if guess in guessed_letters:
            print(f"You already guessed the letter {guess}. Try another one!")
            continue

    
        guessed_letters.add(guess)

        if guess in word:
            print(f"Good job, {name}! You guessed the letter {guess}!")
        else:
            print(f"Incorrect Guess. Try again.")
            tries -= 1

        guessed_word = display_word(word, guessed_letters)
        print(guessed_word)
        print(f"Remaining attempts: {tries}")

    if '_' not in guessed_word:
        print(f"Conratulations {name}! You have won!")
    else:
        print(f"Game Over! The word was {word}.")

if __name__ == "__main__":
    hangman()
