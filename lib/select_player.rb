class SelectPlayer
  attr_accessor :answer, :answer_array

  def choose_player
    puts 'Do you (Human) want to be the maker or the guesser?'
    if gets.chomp == 'maker'
      %w[player computer]
    else
      %w[computer player]
    end
  end
end
