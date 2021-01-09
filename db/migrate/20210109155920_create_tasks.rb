class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :todo
      t.integer :done


      t.timestamps
    end
  end
end
