class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.integer :parent_id
      t.timestamps
    end
  end
end
