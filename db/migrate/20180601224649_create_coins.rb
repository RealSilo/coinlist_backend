class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :symbol, null: false
      t.string :name, null: false
      t.string :currency_type, null: false
      t.string :image

      t.index :symbol, unique: true

      t.timestamps
    end
  end
end
