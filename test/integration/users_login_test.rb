require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:bleejay)
  end

  test 'invalid login message should not appear twice' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty? # makes sure there is a flash message
    get root_path
    assert flash.empty? # makes sure there isn't a flash message
  end

  test 'should login user successfully with valid info followed by logout' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: @user.email,
                                password: "password"}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", root_path

  end

end
