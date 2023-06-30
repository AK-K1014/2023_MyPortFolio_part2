class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :activated
      t.datetime :activated_at
      t.text :introduction

      t.timestamps
    end
  end
end
