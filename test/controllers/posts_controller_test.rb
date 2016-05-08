require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:post1)
    @topic = @post.topic
    @group = @topic.group
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, { group_id: @group, topic_id: @topic, post: { body: @post.body, topic_id: @topic, user_id: @post.user_id } }
    end

    assert_redirected_to group_topic_path(assigns(:group), assigns(:topic))
  end

  test "should update post" do
    patch :update, { group_id: @group, topic_id: @topic, id: @post, post: { body: @post.body, topic_id: @topic, user_id: @post.user_id } }
    assert_redirected_to group_topic_path(assigns(:group), assigns(:topic))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, { group_id: @group, topic_id: @topic, id: @post }
    end

    assert_redirected_to group_topic_path
  end
end
