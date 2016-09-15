require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @user = users(:bleejay)
    @student = @user.students.build(name: "Ruben Cruz")
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

  test 'order should be most recent first' do
    assert_equal students(:most_recent), Student.first
  end

  test 'associated parents should be destroyed' do
    @student.save
    @student.parents.create!(name: "Scuba Steve's Mom", email: "ssteve@aol.com")
    assert_difference "Parent.count", -1 do
      @student.destroy
    end
  end
end
