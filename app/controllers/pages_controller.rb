class PagesController < ApplicationController
  respond_to :json, only: :search
  respond_to :html, only: :index

  def index
    session[:init] = true
    if session[:access_token].present?
      @pictures = pictures_by_hashtag(params[:hashtag])
    else
      redirect_to login_path
    end
  end

  def search
    if params[:hashtag].include? 'railsgirls'
      @pictures = InstagramClient.new(session[:access_token]).search(params[:hashtag])
    else
      @pictures = nil
    end
    respond_with json: @pictures
  end

  def login
    redirect_to Instagram.authorize_url(redirect_uri: REDIRECT_URL)
  end

  def redirect_instagram
    response = Instagram.get_access_token(params[:code], redirect_uri: REDIRECT_URL)
    session[:access_token] = response.access_token
    redirect_to index_url
  end

  private

  def pictures_by_hashtag(hashtag)
    if hashtag.nil? || !hashtag.include?('railsgirls')
      InstagramClient.new(session[:access_token]).search('railsgirls')
    else
      InstagramClient.new(session[:access_token]).search(hashtag)
    end
  end
end
