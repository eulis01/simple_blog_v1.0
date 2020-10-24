class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :image_url
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
