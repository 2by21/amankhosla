class AddMsgToMObileText < ActiveRecord::Migration
  def change
    add_column :mobile_texts, :msg, :string
  end
end
