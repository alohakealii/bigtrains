class CreateGroupHeirarchies < ActiveRecord::Migration
  def change
    create_table :group_heirarchies do |t|
      t.references :parent, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
