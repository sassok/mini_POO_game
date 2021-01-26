require 'pry'
class Player
    attr_accessor :name, :life_points
    @@all_players = Array.new

#initialisation des valeurs de base des PNJs

    def initialize (name)
				@name = name
				@life_points = 10
				@@all_players << self
		end

#affichage de l'état du personnage

		def show_state
			puts "#{@name} a #{@life_points} points de vie."
		end

		def gets_damage(damage)
			@life_points = @life_points - damage
			if @life_points < 1
				puts "Le joueur #{@name} a été tué !"
			end
			return @life_points
		end

#fonction d'attaque

		def attacks(player)
			
			puts "#{@name} mets un sale coup à #{player.name}"
			damage_taken = compute_damage
			puts "Il lui inflige #{damage_taken} points de dommages"
		 player.gets_damage(damage_taken)
		end

#dé 6 de dommages

		def compute_damage
			return rand(1..6)
		end

#retour de l'array liées aux infos des PNJs et au perso du joueur

		def self.all 
			return @@all_players
		end

	end

#initialisation de la classe du joueur

class HumanPlayer < Player
	attr_accessor :weapon_level
  @@all_humans = Array.new

    def initialize (name)
    	super(name)
			@weapon_level = 1
			@life_points = 100
			@@all_humans << self
		end

#Etat de la barre de vie et de l'arme du joueur

		def show_state
			puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}."
		end

#Dé 6 de dommages infligés par le joueur en fonction de l'arme

		def compute_damage
			return rand(1..6) * @weapon_level
		end

#changement d'arme

		def search_weapon
			@weapon_level_new = rand(1..6)
			puts "Tu as trouvé une arme de niveau #{@weapon_level_new}"
				if @weapon_level_new > @weapon_level
					@weapon_level = @weapon_level_new
					puts "Tu as upgradé ton arme ! Fantastique"
				else
					@weapon_level = @weapon_level
					puts "Tu gardes ton gourdin actuel..."
				end
		end

	#médi-pack du joueur : son niveau de vie augmentera en fonction du score d'un dé 6

		def search_health_pack
			@health_pack = rand(1..6)
			if @health_pack == 1
				puts "Tu n'as rien trouvé"
			end
			if @health_pack >= 2 && @health_pack <= 5
				@life_points = @life_points + 50
				puts "Tu as trouvé un pack de 50 ! Merveilleux !"
			end
			if @health_pack == 6
				@life_points = @life_points + 80
				puts "Tu as trouvé un pack de 80 ! Quelle chance !"
			end
			if @life_points >= 100
					@life_points = 100
			end
		end


end













