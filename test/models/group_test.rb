require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "validates name presence" do
    @group1 = groups(:group1)

    @group1.name = nil

    assert_not @group1.valid?
  end

  test "checks childOf on add" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2

  	assert @group2.childOf? @group1
  end

  test "checks parentOf on add" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2

  	assert @group1.parentOf? @group2
  end

  test "checks descendantOf on add" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)
  	@group3 = groups(:group3)

  	@group1.add_child! @group2
  	@group2.add_child! @group3

  	assert @group3.descendantOf? @group1
  end

  test "checks childOf on remove" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2
  	@group1.remove_child! @group2

  	assert_not @group2.childOf? @group1
  end

  test "checks parentOf on remove" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2
  	@group1.remove_child! @group2

  	assert_not @group1.parentOf? @group2
  end

  test "checks root?" do
  	@group1 = groups(:group1)

  	assert @group1.root?
  end

  test "checks not root?" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2

  	assert_not @group2.root?
  end

  test "checks root? after changes" do
  	@group1 = groups(:group1)
  	@group2 = groups(:group2)

  	@group1.add_child! @group2
  	@group1.remove_child! @group2

  	assert @group2.root?
  end
end
