require_relative 'codemaker_class'
require_relative 'code_decoder_class'
require_relative 'select_player'

class PlayersClass
  attr_accessor :code_maker, :code_breaker, :answer, :answer_array, :select_player

  def initialize
    @answer = choose_player
    @code_maker = CodeMaker.new(answer[0])
    @code_breaker = CodeDecoder.new(answer[1])
    # @code_breaker = CodeMaker.new(select_player.select_guesser(select_player.answer_array))
  end

  def choose_player
    puts 'Do you (Human) want to be the maker or the guesser?'
    if gets.chomp == 'maker'
      %w[player computer]
    else
      %w[computer player]
    end
  end
end

examplePlayer = PlayersClass.new
p examplePlayer
