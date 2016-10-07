require 'mocha/test_unit'

class PagesControllerTest < ActionController::TestCase
  def setup
    @search_return = [
      { link: 'link1', url: 'url1', username: 'username1', comment: 'comment1' },
      { link: 'link2', url: 'url2', username: 'username2', comment: 'comment2' }
    ]
    Instagram.stubs(:get_access_token).returns(stub(access_token: 'access-token'))
    InstagramClient.any_instance.stubs(:search).returns(@search_return)
  end

  test 'get index with blank hashtag' do
    session[:access_token] = 'access-token'
    get :index
    assert_response :success
  end

  test 'get index with bh hastagh' do
    session[:access_token] = 'access-token'
    get :index, hashtag: 'railsgirlsbh'
    assert_response :success
  end

  test 'search for a valid tag' do
    get :search, hashtag: 'railsgirlsbh', format: 'json'
    assert_response :success
    assert assigns(:pictures)
  end

  test 'search for a invalid tag' do
    get :search, hashtag: 'bazinga', format: 'json'
    assert_response :success
    assert !assigns(:pictures)
  end
end
