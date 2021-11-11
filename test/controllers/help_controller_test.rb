require "test_helper"

class HelpControllerTest < ActionDispatch::IntegrationTest
  test "should get learn_more" do
    get help_learn_more_url
    assert_response :success
  end
end
