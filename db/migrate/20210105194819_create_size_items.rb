class CreateSizeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :size_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
