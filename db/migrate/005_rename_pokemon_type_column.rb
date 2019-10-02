class RenamePokemonTypeColumn<ActiveRecord::Migration[5.2]
    def change
        rename_column :pokemons, :type, :pokemontype
    end
end