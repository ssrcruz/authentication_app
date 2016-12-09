require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @user = users(:bleejay)
    @student = @user.students.build(name: "Ruben Cruz", parent_name: "Parent Name", parent_email: "parent@email.com")
  end

  test 'should be valid' do
    assert @student.valid?
  end

  test 'user id should be present' do
    @student.user_id = nil
    assert_not @student.valid?
  end

  test 'name should be present' do
    @student.name = nil
    assert_not @student.nil?
  end

  test 'parent name should be present' do
    @student.parent_name = nil
    assert_not @student.nil?
  end

  test 'parent email should be present' do
    @student.parent_email = nil
    assert_not @student.nil?
  end

  test 'order should be most recent first' do
    assert_equal students(:most_recent), Student.first
  end

end
