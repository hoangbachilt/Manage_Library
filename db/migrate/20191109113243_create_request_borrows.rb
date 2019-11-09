class CreateRequestBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :request_borrows do |t|
      t.date :day_borrow
      t.date :day_return
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
