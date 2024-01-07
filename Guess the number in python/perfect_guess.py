import random
randNumber = random.randint(1,100)
# print(randNumber)

userGuess = None
guesses = 0

while(userGuess != randNumber):
    userGuess = int(input("Enter your guess: "))
    guesses += 1
    if userGuess==randNumber:
        print("You guessed it right..")
    else:
        if(userGuess>randNumber):
            print("Enter a smaller number:  ")
        else: 
            print("Enter a larger number:  ")

print(f"You guessed the number in {guesses} guesses.")

with open("score.txt", "r") as f:
    score = int(f.read())

if guesses<score:
    print("You have just broken the high score.")
    with open("score.txt", "w") as f:
        f.write(str(guesses))