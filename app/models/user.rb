class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	has_many :posts
	belongs_to :primary_group, class_name: "Group", foreign_key: "primary_group"

	has_secure_password
end
