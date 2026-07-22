module SelectPlayer
  def choose_player
    puts 'Do you (Human) want to be the maker or the guesser?'
    gets.chomp
  end

  def select_maker(answer)
    array = []
    if answer == 'maker'
      array[0] = 'player'
      array[1] = 'computer'
    elsif answer == 'decoder'
      array[0] = 'computer'
      array[1] = 'player'
    end
    array[0]
  end
end
