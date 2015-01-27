class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :what
      t.string :where
      t.datetime :when
      t.string :how
      t.timestamps
    end
  end
end
