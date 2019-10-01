class CommandLineInterface
    attr_accessor :player
    def new_game
        # returns user input
        puts "Pokemon Sumo"
        puts "Welcome to the amazing world of Pokemon competing by weight"
        puts "Enter 1 for a New Game or 2 to continue:"
        valid_array = ["1", "2"]
        user_input(valid_array)
    end
    def new_user
        puts "What's your name, trainer?"
        username = gets.chomp
        @player = User.create(name: username)
    end

    def bad_input
        puts "Invalid input"
    end
    def quit

    end
    def user_input(valid_array)
        command = ""
        valid_array <<"quit"
        valid_array <<"exit"
        available = "Your options are: "
        valid_array.each {|str| available += str + " - "}
        while !valid_array.include?(command)
            command = gets.chomp
            puts available
        end
        if command == "quit" || command == "exit"
            quit
        end
        command
    end
 
    def select_difficulty
        puts "Select your difficulty level #{self.player.name}"
        puts "Enter 1 for easy, 2 for moderate, or 3 for difficult:"
        valid_array = ["1","2","3"]
        user_input(valid_array).to_i
    end
    def returning_user
        # will have to set @user so that the program knows the current user
    end

    def first_pokemon(difficulty)
        if difficulty == 1
            Pokemon.create(name: Faker::Games::Pokemon.name, weight: Faker::Number.between(from:30, to:40) )
        elsif difficulty == 2
            Pokemon.create(name: Faker::Games::Pokemon.name, weight: Faker::Number.between(from:20, to:30) )
        elsif difficulty == 3
            Pokemon.create(name: Faker::Games::Pokemon.name, weight: Faker::Number.between(from:10, to:20) )
        end
    end

    def pokemon_ownership(pokemon)
        UserPokemon.create(user_id: self.player.id, pokemon_id: pokemon.id)
    end

    def run
        input = new_game
        if input == "1"
            new_user
            d = select_difficulty
            p = first_pokemon(d)
            pokemon_ownership(p)
            puts "Congratulations, #{self.player.name}, you've got a new #{p.name} that weighs #{p.weight} pounds."
        elsif input == "2"
            returning_user
        end
    end
end
