require_relative 'helpers/send_code_module'

class PlayersClass
  attr_accessor :code_maker, :code_breaker

  def self.choose_player
    puts 'Do you (Human) want to be the maker or the guesser?'
    gets.chomp
  end

  def self.maker
    if choose_player == 'maker'
      'player'
    elsif choose_player == 'guesser'
      'computer'
    end
  end
end
