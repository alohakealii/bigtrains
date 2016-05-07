require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "validates title presence" do
  	@topic1 = topics(:topic1)
  	@topic1.title = nil

  	assert_not @topic1.valid?
  end

  test "validates group_id presence" do
  	@topic1 = topics(:topic1)
  	@topic1.group_id = nil

  	assert_not @topic1.valid?
  end
end
