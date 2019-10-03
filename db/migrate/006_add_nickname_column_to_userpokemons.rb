class AddNicknameColumnToUserpokemons<ActiveRecord::Migration[5.2]
    def change
        add_column :user_pokemons, :nickname, :string
    end
end
