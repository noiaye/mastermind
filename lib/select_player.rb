# class SelectPlayer
#   def self.choose_player
#     puts 'Do you (Human) want to be the maker or the guesser?'
#     gets.chomp
#   end
# end

module SelectPlayer
  def choose_player_breaker
    puts 'Do you (Human) want to be the maker or the guesser?'
    answer = gets.chomp
    return unless answer == 'maker'

    'computer'
  end
end
