require 'bundler'
Bundler.require


require_relative 'lib/player'


def perform

#initialisation des joueurs

	player1 = Player.new("Josiane")
	player2 = Player.new("Josè")

#boucle : tant que chaque joueur a encore des points de vie, ils continuent à se taper dessus (si l'un passe à 0 ou moins, on arrête le massacre)

	while player1.life_points > 0 && player2.life_points > 0
		system 'clear'

#on affiche le niveau de vie de chaque joueur à chaque tour

	puts "Voici l'état de chaque joueurs :"
	puts "#{player1.show_state} #{player2.show_state}"
		
#phase d'attaque qui fait référence aux fonctions de "player.rb"

		puts "Passons à la phase d'attaque :"
		if !(player1.life_points <= 0)
			player1.attacks(player2)
		else
			return "#{player1} est mort"
			break
		end
		if !(player2.life_points <= 0)
			player2.attacks(player1)
			puts " "

		else
			return "#{player2} est mort"
			break
		end
	end

end

perform