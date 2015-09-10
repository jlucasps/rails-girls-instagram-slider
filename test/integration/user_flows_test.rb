require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'open main page' do
    get '/'
    assert_response :success
  end

  test 'search for a valid tag' do
    get '/search/railsgirlsbh', format: 'json'
    assert_response :success
    assert assigns(:pictures)
  end

  test 'search for a invalid tag' do
    get '/search/bazinga', format: 'json'
    assert_response :success
    assert !assigns(:pictures)
  end
end
