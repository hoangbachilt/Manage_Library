class CreateRequestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :request_details do |t|
      t.integer :quanity
      t.references :request_borrow, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
