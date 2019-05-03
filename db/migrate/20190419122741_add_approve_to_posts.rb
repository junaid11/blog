class AddApproveToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :approve, :boolean, default: false
  end
end
