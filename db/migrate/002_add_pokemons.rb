class AddPokemons<ActiveRecord::Migration[5.2]
    def change
        create_table :pokemons do |t|
            t.string :name
            t.string :description
            t.string :type
            t.integer :weight
        end
    end
end
