class ChangeTopicsFk < ActiveRecord::Migration
  def change
  	rename_column :topics, :user_id, :group_id
  end
end
