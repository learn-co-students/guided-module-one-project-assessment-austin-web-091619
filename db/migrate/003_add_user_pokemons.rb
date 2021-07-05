class AddUserPokemons<ActiveRecord::Migration[5.2]
    def change
        create_table :user_pokemons do |t|
            t.integer :user_id
            t.integer :pokemon_id
            t.integer :level
        end
    end
end