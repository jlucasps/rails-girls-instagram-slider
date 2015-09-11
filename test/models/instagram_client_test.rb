class InstagramClientTest < ActiveSupport::TestCase
  def setup
    Instagram.stubs(:configure).returns('instagram-token')
    @instagram_client = InstagramClient.new
  end

  test 'configure instagram returns a token' do
    assert_equal 'instagram-token', @instagram_client.token
  end

  test 'search recent media returns a hash' do
    skip('fazer um mock do retorno do chamada client.tag_recent_media()')
  end
end
