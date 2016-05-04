module UsersHelper
	def group_select(user = nil)
		if user.nil? || user.id.nil?
		  collection_select :user, :primary_group, Group.all, :id, :name
		else
		  collection_select :user, :primary_group, Group.all, :id, :name, {selected: user.primary_group.id}
		end
	end
end
