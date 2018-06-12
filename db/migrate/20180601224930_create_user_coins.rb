class CreateUserCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coins do |t|
      t.references :user, foreign_key: true
      t.references :coin, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
