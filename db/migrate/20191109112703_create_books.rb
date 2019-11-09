class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :content
      t.integer :quanity
      t.boolean :status
      t.float :rate_average
      t.string :picture
      t.references :author, foreign_key: true
      t.references :publisher, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
