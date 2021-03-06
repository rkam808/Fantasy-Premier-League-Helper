class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :image_url
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
