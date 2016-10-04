require 'mocha/test_unit'

class InstagramClientTest < ActiveSupport::TestCase
  test 'uses access-token to query instagram' do
    Instagram.expects(:client).with(access_token: 'access-token').returns(stub tag_recent_media: [])
    instagram_client = InstagramClient.new('access-token')
    instagram_client.search('sometag')
  end

  test 'instagram response is parsed to app response' do
    media1 = stub(
      link: 'link1',
      images: stub(low_resolution: stub(url: 'url1')),
      user: stub(username: 'username1'),
      caption: stub(text: 'comment1')
    )

    media2 = stub(
      link: 'link2',
      images: stub(low_resolution: stub(url: 'url2')),
      user: stub(username: 'username2'),
      caption: stub(text: 'comment2')
    )

    Instagram.expects(:client).with(access_token: 'access-token').returns(stub(tag_recent_media: [media1, media2]))
    instagram_client = InstagramClient.new('access-token')
    search = instagram_client.search('sometag')

    expected = [
      { link: 'link1', url: 'url1', username: 'username1', comment: 'comment1' },
      { link: 'link2', url: 'url2', username: 'username2', comment: 'comment2' }
    ]
    assert_equal expected, search
  end
end
