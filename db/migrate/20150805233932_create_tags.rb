class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :card_set
      t.string :name
      t.timestamps null: false
    end
  end
end
