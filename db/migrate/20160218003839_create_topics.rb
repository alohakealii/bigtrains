class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
