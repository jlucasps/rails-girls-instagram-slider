require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @search_return = [
      {link: 'link1', url: 'url1', username: 'username1', comment: 'comment1'},
      {link: 'link2', url: 'url2', username: 'username2', comment: 'comment2'}
    ]
    Instagram.stubs(:configure).returns('instagram-token')
    InstagramClient.any_instance.stubs(:search).returns(@search_return)
  end


  test 'open main page with blank hashtag' do
    get '/'
    assert_response :success
  end

  test 'open main page with bh hashtag' do
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
