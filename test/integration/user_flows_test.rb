require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'open main page' do
    get '/'
    assert_response :success
  end
end
