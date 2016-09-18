require 'test_helper'

class UserStudentPageTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:bleejay)
  end

  test 'user show should display properly' do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_match @user.students.count.to_s, response.body
  end
end
