class CreateFantasies < ActiveRecord::Migration[6.0]
  def change
    create_table :fantasies do |t|
      t.references :player, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
