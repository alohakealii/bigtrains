class Topic < ActiveRecord::Base
	validates :title, presence: true
	validates :group_id, presence: :true
  belongs_to :group
  has_many :posts
end
