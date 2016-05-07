require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "validates topic_id presence" do
    @post1 = posts(:post1)

    @post1.topic_id = nil

    assert_not @post1.valid?
  end

  test "check topic_id value" do
    @post1 = posts(:post1)

    assert @post1.topic_id == 1
  end

  test "check topic of post" do
    @post1 = posts(:post1)
    @topic1 = topics(:topic1)

    assert @topic1.id == 1, "Failed assertion, topic id is " + @topic1.id.to_s
  end

  test "validates body presence" do
    @post1 = posts(:post1)

    @post1.body = nil

    assert_not @post1.valid?
  end
end
