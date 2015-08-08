class CreateCardsLabels < ActiveRecord::Migration
  def change
    create_table :cards_labels do |t|
      t.integer :card_id, null: false
      t.integer :label_id, null: false
    end
  end
end
