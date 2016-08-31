require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'layout link' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    get signup_path
    assert_template 'users/new'
    assert_select 'title', full_title('Sign up')
  end
end
