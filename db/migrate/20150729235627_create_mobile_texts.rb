class CreateMobileTexts < ActiveRecord::Migration
  def change
    create_table :mobile_texts do |t|
      t.text :text

      t.timestamps
    end
  end
end
