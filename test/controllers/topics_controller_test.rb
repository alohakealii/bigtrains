require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:topic1)
    @group = @topic.group
  end

  test "should get index" do
    get :index, group_id: @group
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new, group_id: @group
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, { group_id: @group, topic: { title: @topic.title, group_id: @group } }
    end

    assert_redirected_to group_topic_path(assigns(:topic))
  end

  test "should show topic" do
    get :show, { id: @topic, group_id: @group }
    assert_response :success
  end

  test "should get edit" do
    get :edit, { id: @topic, group_id: @group }
    assert_response :success
  end

  test "should update topic" do
    patch :update, { id: @topic, group_id: @group , topic: { title: @topic.title, group_id: @group } }
    assert_redirected_to group_topic_path(assigns(:topic))
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, { id: @topic, group_id: @group }
    end

    assert_redirected_to group_topics_path
  end
end
