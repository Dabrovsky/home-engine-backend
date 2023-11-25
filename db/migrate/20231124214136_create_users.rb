# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
