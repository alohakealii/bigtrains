class Topic < ActiveRecord::Base
	validates :title, presence: true
  belongs_to :group
  has_many :posts
end
