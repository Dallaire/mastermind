class Code
  attr_accessor :code

  def get_hint(guess)
    Code.check_matches(@code, guess)
  end

  def self.check_matches(secret_code, guess)
    secret = Array.new(secret_code)
    guessed = Array.new(guess)
    hint=[]
    guessed.each_with_index do |piece, i|
      if (piece == secret[i])
        hint << :correct_spot
        secret[i] = nil
        guessed[i] = nil
      end
    end
    guessed.each do |piece|
      if piece != nil && secret.index(piece)
        hint << :wrong_spot
        secret[secret.index(piece)] = nil
      end
    end
    return hint.sort
  end
end
