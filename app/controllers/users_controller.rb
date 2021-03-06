class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # PATCH/PUT /primary_group?group_id=n
  def set_primary_group
    @user = current_user
    group = Group.find params[:group_id]
    @user.primary_group = group
    respond_to do |format|
      if @user.save
        format.html { redirect_to group, notice: 'Primary group was successfully updated.' }
      else
        format.html { redirect_to group, status: 'Error updating primary group' }
      end
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless session[:user_id] == @user.id
      redirect_to root_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    params = user_params
    params[:primary_group] = Group.find(params[:primary_group])
    @user = User.new(params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to group_path(@user.primary_group.id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    params = user_params
    params[:primary_group] = Group.find(params[:primary_group])
    respond_to do |format|
      if @user.update(params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :primary_group)
    end
end
