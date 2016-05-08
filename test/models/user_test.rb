require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "random_username", password: "testing", password_confirmation: "testing")
  end
  
  test "is valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "password should not be empty" do
    @user.password = @user.password_confirmation= " " * 6
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "username should be saved lowercase" do
    username = "RaNdoM_uSeRnAmE"
    @user.username = username
    @user.save
    assert_equal username.downcase, @user.reload.username
  end

end
