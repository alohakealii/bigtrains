require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:post1)
    @topic = @post.topic
    @group = @topic.group
  end

  test "should get index" do
    get :index, { group_id: @group, topic_id: @topic }
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, { group_id: @group, topic_id: @topic}
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, { group_id: @group, topic_id: @topic, post: { body: @post.body, topic_id: @topic, user_id: @post.user_id } }
    end

    assert_redirected_to group_topic_post_path(assigns(:post))
  end

  test "should show post" do
    get :show, { group_id: @group, topic_id: @topic, id: @post }
    assert_response :success
  end

  test "should get edit" do
    get :edit, { group_id: @group, topic_id: @topic, id: @post }
    assert_response :success
  end

  test "should update post" do
    patch :update, { group_id: @group, topic_id: @topic, id: @post, post: { body: @post.body, topic_id: @topic, user_id: @post.user_id } }
    assert_redirected_to group_topic_post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, { group_id: @group, topic_id: @topic, id: @post }
    end

    assert_redirected_to group_topic_path
  end
end
