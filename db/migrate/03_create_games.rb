class CreateGames < ActiveRecord::Migration[5.2]
    def change
        create_table :games do |t|
            t.integer :completion_time
            t.integer :user_id
            t.integer :level_id
        end
    end
end