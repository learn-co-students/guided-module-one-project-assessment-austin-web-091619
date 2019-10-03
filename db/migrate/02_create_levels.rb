class CreateLevels < ActiveRecord::Migration[5.2]
    def change
        create_table :levels do |t|
            t.text :name
        end
    end
end
