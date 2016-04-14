class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, notice: "Welcome, #{user.first_name}!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Log out successful"
	end

	def home
		if !session[:user_id]
			redirect_to groups_path
		else
			redirect_to group_path(id: User.find(session[:user_id]).primary_group)
		end
	end
end
