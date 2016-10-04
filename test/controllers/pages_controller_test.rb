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

  test 'get index without access_token redirects to login' do
    get :index
    assert_redirected_to login_url
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

  test 'loggin page redirects to Instagram' do
    callback_url = 'http://localhost:3000/redirect_instagram'
    get :login
    assert_redirected_to Instagram.authorize_url(redirect_uri: callback_url)
  end

  test 'recirect_url sets session token from code' do
    get :redirect_instagram, params: { code: 'instagram-code' }
    assert_equal session[:access_token], 'access-token'
  end

  test 'recirect_url redirects to home' do
    get :redirect_instagram, params: { code: 'instagram-code' }
    assert_redirected_to index_url
  end
end
