class Player #for human to inherit
  def react(hint, guess)
  end
end

class Human < Player
  def guess
    guess_made = false
    while guess_made == false
      guess=[]
      puts "\nTake a Guess."
      guess_input = gets.chomp
      if(guess_input.length <= 4)
        guess_made = true
        guess_input.each_char do |i|
          if(i.to_i <= 6 && i.to_i > 0)
            guess << i.to_i
          else
            guess_made = false
          end
        end
      end
      puts "Guesses must be 4 or less numbers from 1-6." if guess_made==false
    end
    return guess
  end

  def set_code
     code_made = falsea
    while code_made == false
      puts "Set the secret code"
      code = []
      code_input = gets.chomp
      if(code_input.length == 4)
        code_made = true
        code_input.each_char do |i|
          if(i.to_i <= 6 && i.to_i > 0)
            code << i.to_i
          else
            code_made = false
          end
        end
      end
      puts "Code must be 4 numbers from 1-6." if code_made==false
    end
    return code
  end
end

class AI < Player #uses 5 guess algorithim
  def initialize  #generates all possible codes into one set
    @set = []
    numbers=[1,2,3,4,5,6]
    for i in numbers
      for j in numbers
        for k in numbers
          for l in numbers
            @set << [i,j,k,l]
          end
        end
      end
    end
  end

  def set_code
    code=[]
    4.times { code << (rand(6) + 1) } #avoids 0 pick because of to_i returning 0 on letters
    return code
  end

  def guess
    guess = @set[rand(@set.length)]
    puts "Guess is: #{guess}"
    return guess
  end

  def react(hint, guess) #deletes all codes that cannot give the same hint as recieved
    @set.delete_if {|i| hint != Code.check_matches(i, guess)}
  end
end
