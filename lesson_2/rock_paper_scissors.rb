VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_MOVES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors)
}

score = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts "=> #{message}"
end

def get_user_choice
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp.downcase

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  user_choice
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def update_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def display_score(score)
  prompt("Your score is #{score[:player]}")
  prompt("The computer's score is #{score[:computer]}")
end

def reset_scores(score)
  score[:player] = 0
  score[:computer] = 0
end

def grand_winner?(score)
  score[:player] == 5 || score[:computer] == 5
end

def display_grand_winner(score)
  if score[:player] == 5
    prompt("You are the grand winner")
  elsif score[:computer] == 5
    prompt("The computer is the grand winner")
  end
end

def play_again?
  user_input = ''
  loop do
    prompt("Do you want to play again?")
    user_input = gets.chomp.downcase
    if %(y n).include?(user_input)
      break
    else
      prompt("Please enter y or n.")
    end
  end
  user_input == 'y'
end

play_again = true

while play_again
  prompt("Welcome! Win five games and become the grand winner!")

  loop do
    choice = get_user_choice
    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}, the computer chose #{computer_choice}")

    display_results(choice, computer_choice)
    update_score(choice, computer_choice, score)
    display_score(score)

    if grand_winner?(score)
      display_grand_winner(score)
      reset_scores(score)
      break
    end
  end

  play_again = play_again?
end

prompt('Thank you for playing. Goodbye!')
