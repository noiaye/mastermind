module CompareGuess
  def compare_guess_code_win(guess, code)
    return unless guess == code

    p 'You win!'
  end

  def compare_guess_code_again(guess, code, amount)
    return unless guess != code && amount < 12

    p 'Incorrect, guess again'
  end

  def compare_guess_code_lose(guess, code, amount)
    return unless guess != code && amount >= 12

    p 'You lose!'
  end
end
