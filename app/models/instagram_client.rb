class InstagramClient
  attr_reader :access_token
  COUNT = 15

  def initialize(access_token)
    @access_token = access_token
    Instagram.configure do |config|
      config.client_id = ENV['INSTAGRAM_CLIENT_ID']
      config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
    end
  end

  def search(hashtag)
    medias = Instagram.client(access_token: access_token).tag_recent_media(hashtag, count: COUNT)
    medias.map do |media|
      {
        link: media.link,
        url: media.images.low_resolution.url,
        username: media.user.username,
        comment: media.caption.text
      }
    end
  end
end
