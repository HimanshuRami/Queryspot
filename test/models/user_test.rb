require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Himanshu", email: "ramihimanshu27@gmail.com")
  end

 test "should be valid" do 
 		assert @user.valid?
 	end

 	test "name should be present" && "Name should not be too long" do 
 		@user.name = ""
 		@user.name = "a" * 51
 		assert_not @user.valid?
 	end


 	test "Email should be present" && "Email should not be too long" do
		@User.email = " "
	 	@user.email = "a" * 244 + "@example.com"
	 	assert_not @user.valid?
 	end
end


