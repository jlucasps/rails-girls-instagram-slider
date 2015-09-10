class InstagramClient
  attr_reader :token
  COUNT = 15

  def initialize
    @token = Instagram.configure do |config|
      config.client_id = ENV['INSTAGRAM_CLIENT_ID']
      config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
    end
  end

  def search(hashtag) # rubocop:disable Metrics/AbcSize
    medias = Instagram.client.tag_recent_media(hashtag, count: COUNT)
    medias.map do |media|
      comment = (media.comments.data.any? ? media.comments.data[0].text : '')
      {
        link: media.link,
        url: media.images.standard_resolution.url,
        username: media.user.username,
        comment: comment
      }
    end
  end
end
