require 'test_helper'

class HomesTest < ActionDispatch::IntegrationTest
  test "the application works" do
  	visit "/"
  	assert_response(:success)
  end
end