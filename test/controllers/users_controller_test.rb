require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user1)
    @primary_group = @user.primary_group
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { first_name: @user.first_name, last_name: @user.last_name, phone: @user.phone, email: "newtest@bigtrains.com", password: "password", password_confirmation: "password", primary_group: @primary_group }
    end

    assert_redirected_to group_path(assigns(:user).primary_group)
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, {id: @user, user: { first_name: @user.first_name, email: @user.email, primary_group: @user.primary_group.id } }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
