class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :what
      t.datetime :when
      t.string :where
      t.string :how

      t.timestamps
    end
  end
end
