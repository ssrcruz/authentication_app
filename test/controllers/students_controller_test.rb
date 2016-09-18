require 'test_helper'

class StudentsControllerTest < ActionController::TestCase

  def setup
    @student = students(:scubasteve)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Student.count' do
      post :create, student: { name: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy if not logged in' do
    assert_no_difference 'Student.count' do
      delete :destroy, id: @student
    end
    assert_redirected_to login_url
  end
end
