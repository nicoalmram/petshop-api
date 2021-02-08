class CreateAnimalItems < ActiveRecord::Migration[6.1]
  def change
    create_table :animal_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
