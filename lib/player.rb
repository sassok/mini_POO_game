require 'pry'
class Player
    attr_accessor :name, :life_points
    @@all_players = Array.new

    def initialize (name)
				@name = name
				@life_points = 10
				@@all_players << self
		end

		def show_state
			puts "#{@name} a #{@life_points} points de vie."
		end

		def gets_damage(damage)
			@life_points = @life_points - damage
			if @life_points < 1
				puts "le joueur #{@name} a été tué !"
			end
			return @life_points
		end

		def attacks(player)
			puts "le joueur #{@name} attaque le joueur #{player.name}"
			damage_taken = compute_damage
			puts "il lui inflige #{damage_taken} points de dommages"
		 player.gets_damage(damage_taken)
		 player.show_state

		end

		def compute_damage
			return rand(1..6)
		end

		def self.all 
			return @@all_players
		end

	end