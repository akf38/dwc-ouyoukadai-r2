class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.integer :user_id
      t.references :book, foreign_key: true
      t.text :content
      t.timestamps
    end
    
    add_foreign_key :book_comments, :users
  end
end
