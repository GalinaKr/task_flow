class AddFilesFieldForTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :files, :string
  end
end
