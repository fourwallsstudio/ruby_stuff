require 'observer'
require 'colorize'

class DuckGooseGame
  include Observable

  def play
    puts 'say duck or goose'.colorize(:blue)
    puts 'to quit type: quit'.colorize(:blue)
    response = ''

    while response != 'quit'
      puts 'say duck or goose: '.colorize(:blue)
      response = gets.chomp
      changed
      notify_observers(response)
    end

    puts 'bye!'.colorize(:red)
  end
end


class CompPlayer
  def initialize(game)
    game.add_observer(self)
  end
end

class Dumb < CompPlayer
  def update(response)
    if response != 'duck' &&
       response != 'goose' &&
       response != 'quit'

      puts 'not sure what you said there'.colorize(:red)
    end
  end
end

class Smart < CompPlayer
  def update(response)
    puts 'GoooOOOOooooOOOOOossssSSSseeeee'.colorize(:red) if response == 'goose'
  end
end

if __FILE__ == $PROGRAM_NAME
  game = DuckGooseGame.new
  Dumb.new(game)
  Smart.new(game)
  game.play
end
