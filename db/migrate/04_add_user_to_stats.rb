class AddUserToStats < ActiveRecord::Migration[5.2]
    def change
        add_column :stats, :user_id, :integer
    end
end
