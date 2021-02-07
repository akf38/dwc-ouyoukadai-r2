class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.references :book, foreign_key: true
      t.timestamps
    end
    add_foreign_key :favorites, :users 
  end
end
