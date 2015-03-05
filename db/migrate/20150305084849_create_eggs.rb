class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.string :link
      t.timestamps
    end
  end
end
