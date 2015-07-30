class AddScrollMessageToMobileTexts < ActiveRecord::Migration
  def change
    add_column :mobile_texts, :scroll_msg, :string
  end
end
