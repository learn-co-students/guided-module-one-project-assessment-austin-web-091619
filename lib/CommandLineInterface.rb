require_relative 'MainMenu'
class CommandLineInterface
    attr_accessor :player, :boss1, :boss2, :boss3, :currentboss, :boss4
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
        # valid_array <<"quit"
        # valid_array <<"exit"
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
        UserPokemon.create(user_id: self.player.id, pokemon_id: pokemon.id, level: 1)

    end

    def main_menu
        puts "Welcome #{self.player.name}"
        puts "You can:"
        puts "1 -- Battle the next boss"
        puts "2 -- Train against a pokemon"
        puts "3 -- View your pokemon"
        puts "4 -- Restart your game"
        puts "5 -- Close the game"
        puts "6 -- Give a pokemon a nickname"
        valid_array=["1", "2","3","4","5","6"]
        user_input(valid_array)
    end
    def weight_category(pokemon)
        weight = pokemon.weight * find_userpokemon(self.player, pokemon).level
        if weight < 100
            return "tiny"
        elsif  weight <300
            return "small"
        elsif weight <600
            return "normal"
        elsif weight <1000
            return "large"
        else 
            return "huge"
        end
    end

    def view_pokemon
        pokemons = self.player.pokemons
        puts "You own the following pokemon:"
        
        pokemons.each do |pokemon|
            userpokemon = find_userpokemon(self.player, pokemon)
            w = pokemon.weight * userpokemon.level
            puts "ID# #{userpokemon.id}. A #{weight_category(pokemon)} #{pokemon.name.capitalize} that weighs #{w} pounds"
            if userpokemon.nickname
                puts "---Nicknamed:   '#{userpokemon.nickname}'"
            end
        end
       
    end
    def find_userpokemon(user, pokemon)
        UserPokemon.find_by(user_id: user.id, pokemon_id: pokemon.id)
    end
    
    def update_boss
        bossname = "boss#{player.level}"
        self.currentboss = self.send(bossname)
    end
    

    def next_boss 
        update_boss
        if self.currentboss == self.boss4
            puts "You beat 'em all!!!"
            puts "Congratulations #{self.player.name} you've got the heaviest pokemon team ever!"
            puts "Maybe you should start your challenge again."
            return
        end
        clear_screen
        if self.player.level == 1
            meowth
        elsif self.player.level == 2
            arbok
        elsif self.player.level == 3
            muk
        end

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
        player.save
        update_boss
        puts "Your next challenge is taking on #{self.currentboss.name}"
    end

    def run
        bosses
        clear_screen
        splash
        input = new_game
        if input == 1
            new_user
            # d = select_difficulty
            # pokemon = first_pokemon(d)
            pokemon = random_pokemon
            pokemon_ownership(pokemon)

            clear_screen
            puts "Congratulations, #{self.player.name}, you've got a new #{pokemon.name.capitalize} that weighs #{pokemon.weight} pounds."
            pokeball
        elsif input == 2
            returning_user
            clear_screen
        end
        input = main_menu
        while input != 5
            case input
            when 1
                next_boss
            when 2
                rando = random_pokemon
                results = trainer_battle(rando)
                if results == "loss"
                    clear_screen
                    machamp
                    puts "You got beat by a #{rando.name}"
                    puts "Hopefully you'll have better luck next time."
                else
                    # if we win, trainingbattle returns the pokemon the player beat
                    leveling_up(results)
                end
                
            when 3
                clear_screen
                view_pokemon
            when 4
                # delete user
                # call new_user
                delete_user
                new_user
                # d = select_difficulty
                # pokemon = first_pokemon(d)
                pokemon = random_pokemon
                pokemon_ownership(pokemon)
            when 5
                puts "Goodbye!"
                break
            when 6
                clear_screen
                id = selectpokemon
                makenickname(id)
            end
            input = main_menu
        end
    end
    def leveling_up(pokemon)
        x = rand(1..4)
      
        if x == 1
            UserPokemon.create(user_id: self.player.id, pokemon_id: pokemon.id, level: 1)

            clear_screen
            pokeball
            puts "A #{pokemon.name.capitalize} joined your team!!!!!!!!"

        elsif x ==2 || x==3
            p=self.player.pokemons.sample
            u_p = find_userpokemon(self.player, p)
            u_p.level += 1
            u_p.save
            clear_screen
            cherry

            puts "One of your pokemon got slightly heavier."
        else
            u_p = self.player.user_pokemons.sample
            u_p.level += 2
            u_p.save
            clear_screen
            add_sig_weight

            puts "One of your pokemon really put on some pounds"
        end
    end
    def training_pokemon
        Pokemon.all.random
    end
    def random_pokemon
        id = rand(1..150)
        p = PokeApi.get(pokemon: id) 
        
        poke = Pokemon.find_or_create_by(name: p.species.name)
        poke.weight=p.weight
        poke.pokemontype=p.types[0].type.name
        poke.save
        poke
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
        @boss4 = "Complete"
        bosses_pokemon
    end

    def bosses_pokemon
        meowth = Pokemon.find_or_create_by(name: "Meowth", weight: 500)
        arbok =Pokemon.find_or_create_by(name: "Arbok", weight: 2000)
        muk = Pokemon.find_or_create_by(name: "Muk", weight: 5000)
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
    
        wa = a.map{|p|  p.weight * find_userpokemon(user1, p).level} 
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
        a = self.player.pokemons.first.weight
        b = pokemon.weight 
        if a  > b  
            return pokemon 
        else
            return "loss"
        end
    end

    def selectpokemon
        # shows the user the pokemon and returns the user_pokemon id to update
        view_pokemon
        puts "Select which pokemon to change the nickname of by its ID#"
        valid_array = []
        self.player.pokemons.each do |pokemon|
            valid_array << find_userpokemon(self.player, pokemon).id.to_s
        end
        number = user_input(valid_array)
    end
    def makenickname(id)
        puts "What should the pokemons nickname be?"
        nick = user_text_input
        p = UserPokemon.find_by(id: id)
        p.nickname = nick
        p.save
    end
end
