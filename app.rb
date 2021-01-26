require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



#player1.show_state
#binding.pry

def perform
	player1 = Player.new("Josiane")
	player2 = Player.new("Josè")
	puts "Voici l'état de chaque joueurs: "
	#puts " "
	puts "#{player1.show_state} #{player2.show_state}"
	while player1.life_points > 0 && player2.life_points > 0
		if !(player1.life_points <= 0)
			player1.attacks(player2)
			puts " "
		else
			return "#{player1} est mort"
		end
		if !(player2.life_points <= 0)
			player2.attacks(player1)
			puts " "
		else
			return "#{player2} est mort"
		end
	end
end

perform