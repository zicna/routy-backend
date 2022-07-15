class CreatePins < ActiveRecord::Migration[7.0]
  def change
    create_table :pins do |t|
      t.references :route, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
