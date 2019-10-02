
class CommandLineInterface
    attr_accessor :player, :boss1, :boss2, :boss3, :currentboss
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
        username = user_text_input

        while User.find_by(name: username)
           puts "We already have a user by that name, please choose a different name"
           username = user_text_input
        end

        @player = User.create(name: username, level:1)

    end

    def bad_input
        puts "Invalid input"
    end
    def quit
        # should exit the program
        
    end
    def user_text_input
        # a method to get text from the user
        # used for name
        gets.chomp
    end
    def user_input(valid_array)
        valid_array <<"quit"
        valid_array <<"exit"
        available = "Your options are: "
        valid_array.each {|str| available += str + " - "}
        command = gets.chomp
        while !valid_array.include?(command)
            puts available
            command = gets.chomp
        end
        if command == "quit" || command == "exit"
            quit
        end
        
        command.to_i
    end
 
    def select_difficulty
        puts "Select your difficulty level #{self.player.name}"
        puts "Enter 1 for easy, 2 for moderate, or 3 for difficult:"
        valid_array = ["1","2","3"]
        user_input(valid_array)
    end
    def returning_user
        # will have to set @user so that the program knows the current user
        puts "Welcome back! What was your user name?"
        username = user_text_input
        while !User.find_by(name: username)
            puts "User name not found, enter another user name"
            username = user_text_input
        end
        @player = User.find_by(name: username)
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
    def main_menu
        puts "Welcome #{self.player.name}"
        puts "You can:"
        puts "1 -- Battle the next boss"
        puts "2 -- Train against a pokemon"
        puts "3 -- View your pokemon"
        puts "4 -- Restart your game"
        puts "5 -- Close the game"
        valid_array=["1", "2","3","4","5"]
        user_input(valid_array)
    end
    def weight_category(pokemon)
        if pokemon.weight < 10
            return "tiny"
        elsif  pokemon.weight <20
            return "small"
        elsif pokemon.weight <30
            return "normal"
        elsif pokemon.weight <40
            return "large"
        elsif pokemon.weight <50
            return "huge"
        end
    end
    def view_pokemon
        pokemons = self.player.pokemons
        puts "You own the following pokemon:"
        pokemons.each do |pokemon|
            puts "A #{weight_category(pokemon)} #{pokemon.name} that weighs #{pokemon.weight} pounds"
        end

    end
    
    def update_boss
        bossname = "boss#{player.level}"
        self.currentboss = self.send(bossname)
    end
    

    def next_boss 
        update_boss
        
        puts "Your next challenge is #{self.currentboss.name}."
        result = player_battle(self.player, self.currentboss)
        puts "after the dust clears, the final pokemon belongs to #{result.name}"
        if result == player
            beat_a_boss
        else
            lost_to_boss
        end

    
    end
    def lost_to_boss
        puts "Sorry #{self.player.name} , #{self.currentboss.name} got you."
        puts "Train a little bit and then try again"
    end
    def beat_a_boss
        puts "Congratulations on beating #{self.currentboss.name}"
        player.level+=1
        update_boss
        puts "Your next challenge is taking on #{self.currentboss.name}"
    end
    def run
        bosses
        input = new_game
        if input == 1
            new_user
            d = select_difficulty
            pokemon = first_pokemon(d)
            pokemon_ownership(pokemon)
            puts "Congratulations, #{self.player.name}, you've got a new #{pokemon.name} that weighs #{pokemon.weight} pounds."
        elsif input == 2
            returning_user
        end
        input = main_menu
        while input != 5
            case input
            when 1
                next_boss
            when 2
                # training_battle
                # t = training_pokemon
                # if trainer wins 
                # run pokemon_ownership(t)
            when 3
                view_pokemon
            when 4
                # delete user
                # call new_user
                delete_user
                new_user
                d = select_difficulty
                pokemon = first_pokemon(d)
                pokemon_ownership(pokemon)
            when 5
                break
            end
            input = main_menu
        end
    end

    def training_pokemon
        Pokemon.all.random
    end

    def  bosses
        if !User.find_by(name: "Jesse", boss: "T")
           @boss1 = User.create(name: "Jesse", boss: "T")
        else
            @boss1 = User.find_by(name: "Jesse", boss: "T")
        end
        if !User.find_by(name: "James", boss: "T")
            @boss2 = User.create(name: "James", boss: "T")
        else
            @boss2 = User.find_by(name: "James", boss: "T")
        end
        if !User.find_by(name: "Giovanni", boss: "T")
            @boss3 = User.create(name: "Giovanni", boss: "T")
        else 
            @boss3 = User.find_by(name: "Giovanni", boss: "T")
        end
        bosses_pokemon
    end

    def bosses_pokemon
        meowth = Pokemon.find_or_create_by(name: "Meowth", weight: 30)
        arbok =Pokemon.find_or_create_by(name: "Arbok", weight: 40)
        muk = Pokemon.find_or_create_by(name: "Muk", weight: 50)
        if !UserPokemon.find_by(user_id: self.boss1.id, pokemon_id: meowth.id) 
            UserPokemon.create(user_id: self.boss1.id, pokemon_id: meowth.id)
        end
        if !UserPokemon.find_by(user_id: self.boss2.id, pokemon_id: arbok.id) 
            UserPokemon.create(user_id: self.boss2.id, pokemon_id: arbok.id)
        end

        if !UserPokemon.find_by(user_id: self.boss3.id, pokemon_id: muk.id) 
             UserPokemon.create(user_id: self.boss3.id, pokemon_id: muk.id)
        end

    end

    def player_battle(user1, user2)
        a = user1.pokemons
        b = user2.pokemons
        wa = a.map{|p| p.weight} 
        wb = b.map{|p| p.weight}
        total_a = wa.sum 
        total_b = wb.sum
        if total_a > total_b
            return user1
        else 
            return user2
        end 
    end
    def delete_user
        UserPokemon.where(user_id: self.player.id).destroy_all
        player.destroy
    end

    def trainer_battle(pokemon)
        a = @player
        b = pokemon.pokemons 
        player_w = a.map{|p| p.weight}
        opponent_w = a.map{|p| p.weight}
        total_player_weight = pw.sum
        total_
    end

end
