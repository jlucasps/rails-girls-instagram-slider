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
    # recent_media_return = [
    #   stub(media: stub(link: 'link1') ),
    #     stub(images: stub(standard_resolution: stub(url: 'url1'))),
    #               stub(user: stub(username: 'username1')),
    #               stub(comments: stub(data: [stub(text: 'comment1')]))
    # ]
    # Instagram.stubs(:client).returns(stub(tag_recent_media: recent_media_return))
    # expected = [
    #   { link: 'link1', url: 'url1', username: 'username1', comment: 'comment1'}
    # ]
    # assert_equal expected, @instagram_client.search('railsgirls')
  end
end
