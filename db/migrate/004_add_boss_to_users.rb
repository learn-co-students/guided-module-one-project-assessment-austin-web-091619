class AddBossToUsers < ActiveRecord::Migration[5.2]
    def change 
        add_column :users, :boss, :boolean
    end
end