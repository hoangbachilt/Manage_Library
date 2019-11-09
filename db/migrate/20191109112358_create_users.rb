class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :email
      t.string :name
      t.string :password_digest
      t.boolean :status

      t.timestamps
    end
  end
end
