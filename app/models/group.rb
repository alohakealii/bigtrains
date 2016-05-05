class Group < ActiveRecord::Base
	has_many :children, 
		class_name: "Group", 
		through: :child_connections,
		source: :child,
		dependent: :destroy
	has_many :parents, 
		class_name: "Group", 
		through: :parent_connections,
		source: :parent
	has_many :topics

	def childOf?(other)
		parents.include? other
	end

	def parentOf?(other)
		children.include? other
	end

	def descendantOf?(other)
		if root?
			false
		elsif childOf? other
			true
		else
			parents.any? { |parent| parent.descendantOf? other }
		end
	end

	def root?
		parents.empty?
	end

	def add_child!(other)
		if descendantOf? other
			raise "Cannot make child of group in parent chain"
		end
		
		children << other
	end

	def remove_child!(other)
		children.delete(other)
	end

	private
		has_many :child_connections,
			class_name: "GroupHeirarchy",
			foreign_key: :parent_id
		has_many :parent_connections,
			class_name: "GroupHeirarchy",
			foreign_key: :child_id
end
