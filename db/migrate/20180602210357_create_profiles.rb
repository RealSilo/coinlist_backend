class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.string :location
      t.string :phone

      t.timestamps
    end
  end
end
