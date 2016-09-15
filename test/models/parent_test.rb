require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  def setup
    @student = students(:scubasteve)
    @parent = @student.parents.build(name: "Scuba Steve's Mom", email: "sstevemom@aol.com" )
  end

  test 'should be valid' do
    assert @parent.valid?
  end

  test 'student id should be present' do
    @parent.student_id = nil
    assert_not @parent.valid?
  end

  test 'name should be present' do
    @parent.name = " "
    assert_not @parent.valid?
  end

  test 'email should be present' do
    @parent.email = " "
    assert_not @parent.valid?
  end
end
