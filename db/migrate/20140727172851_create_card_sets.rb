class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.belongs_to :user
      t.boolean :public
      t.string :name
      t.timestamps
    end
  end
end
