class CreateLocationCategorizations < ActiveRecord::Migration
  def change
    create_table :location_categorizations do |t|
      t.references :location, index: true, foreign_key: true
      t.string :category

      t.timestamps null: false
    end
  end
end
