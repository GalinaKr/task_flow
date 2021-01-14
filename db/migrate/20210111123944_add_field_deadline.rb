class AddFieldDeadline < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :deadline, :datetime, precision: 6
  end
end
