class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :from
      t.text :message
      t.integer :item_id
      t.timestamps
    end
  end
end
