import random

characters = open('characters.txt').read().splitlines()

solution = random.choice(characters).upper()
guesses = []
current_set = [" " if c == " " else "_" for c in solution]
remaining_guesses_n = 6

print (" ").join(current_set)

while remaining_guesses_n >= 0:
  if len(guesses) > 0:
    print "You've guessed: %s " % (", ").join(guesses)
  print "Remaining guesses: %s" % remaining_guesses_n
  guess = str(raw_input('Guess a letter: ')).upper()

  if guess not in solution:
    remaining_guesses_n -= 1
    guesses.append(guess)
  else:
    for i, c in enumerate(solution):
      if guess == c:
        current_set[i] = guess

  print "\n"
  print (" ").join(current_set)
  print "\n"
  
  if "_" not in current_set:
    print "You've won!! Good job."
    exit()

print "You lose! :("
print "The answer is: %s" % solution
