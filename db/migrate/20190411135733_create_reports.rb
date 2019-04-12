class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.belongs_to :user, index: true
      t.references :reportable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
