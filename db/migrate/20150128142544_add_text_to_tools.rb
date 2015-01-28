class AddTextToTools < ActiveRecord::Migration
  def change
    add_column :tools, :text, :string
  end
end
