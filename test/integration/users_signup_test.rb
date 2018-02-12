require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar"} }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors input#user_name'
    assert_select 'div.field_with_errors input#user_email'
    assert_select 'div.field_with_errors input#user_password'
    assert_select 'div.field_with_errors input#user_password_confirmation'
    assert_select 'form[action="/signup"]'
  end

end
