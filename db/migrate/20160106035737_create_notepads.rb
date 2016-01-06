class CreateNotepads < ActiveRecord::Migration
  def change
    create_table :notepads do |t|
      t.string :name
      t.text :content
      t.timestamps null: false
    end
  end
end
