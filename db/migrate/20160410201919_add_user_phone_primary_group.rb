class AddUserPhonePrimaryGroup < ActiveRecord::Migration
  def change
  	add_column :users, :phone, :string
  	add_column :users, :primary_group, :integer
  end
end
