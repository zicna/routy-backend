class CreateMarkers < ActiveRecord::Migration[7.0]
  def change
    create_table :markers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.float :latitude
      t.float :longitude


      t.timestamps
    end
  end
end
