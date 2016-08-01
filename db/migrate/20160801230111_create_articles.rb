class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :user_email
      t.string :edit_url
      t.integer :category_id

      t.timestamps
    end
  end
end
