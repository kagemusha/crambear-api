class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.belongs_to :card_set
      t.string :name
      t.timestamps null: false
    end
  end
end
