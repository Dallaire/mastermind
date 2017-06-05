require_relative 'Code'
require_relative 'Player_and_AI'
while true
  secret=Code.new()
  hinter = nil
  guesser = nil

  loop do
    puts "Would you like to guess or set the super secret code?"
    answer = gets.chomp.downcase
    if(answer == "guess")
      hinter = AI.new()
      guesser = Human.new()
      break
    elsif (answer == "set")
      hinter = Human.new()
      guesser = AI.new()
      break
    else
      puts "Please enter guess or set"
    end
  end

  secret.code = hinter.set_code

  hint = []
  turns=0
  while turns < 12
    turns += 1
    puts "Turn #{turns}"
    guess = guesser.guess
    hint = secret.get_hint(guess)
    break if(hint.count(:correct_spot) == 4)
    puts "Here is the hint: #{hint}"
    guesser.react(hint, guess)
  end

  if(hint.count == 4)
    puts "Code was cracked! Code: #{secret.code}"
  else
    puts "The code remained secret! Code: #{secret.code}"
  end

  puts "Play again? (Y/N)"
  break if(gets.chomp.upcase != "Y")
end
