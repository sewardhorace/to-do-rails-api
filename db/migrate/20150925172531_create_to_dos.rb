class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
