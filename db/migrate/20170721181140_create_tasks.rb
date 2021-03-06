class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :description
      t.integer :priority
      t.boolean :completed
      t.text :note

      t.timestamps
    end
  end
end
