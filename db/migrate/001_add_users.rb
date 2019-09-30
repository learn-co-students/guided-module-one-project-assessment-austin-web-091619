class AddUsers<ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.string :name
            t.integer :level
        end
    end

end