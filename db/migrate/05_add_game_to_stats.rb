class AddGameToStats < ActiveRecord::Migration[5.2]
    def change
        add_column :stats, :game_id, :integer
    end
end
