class CreateCardsTags < ActiveRecord::Migration
  def change
    create_table :cards_tags do |t|
      t.integer :card_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
