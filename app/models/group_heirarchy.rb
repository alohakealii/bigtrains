class GroupHeirarchy < ActiveRecord::Base
  belongs_to :parent, class_name: 'Group'
  belongs_to :child, class_name: 'Group'
end
