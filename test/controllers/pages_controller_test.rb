class PagesControllerTest < ActionController::TestCase
  test 'get index' do
    get :index
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
