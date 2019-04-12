class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :body
      t.string :reference_text
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.timestamps
    end
  end
end
