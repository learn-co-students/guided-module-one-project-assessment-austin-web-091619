class CreateStats < ActiveRecord::Migration[5.2]
    def change
        create_table :stats do |t|
            t.integer :completion_time
        end
    end
end