class PagesController < ApplicationController
  respond_to :json, only: :search
  respond_to :html, only: :index

  def index
    session[:init] = true
    session[:access_token] = ENV['INSTAGRAM_ACCESS_TOKEN']
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

  private
    def pictures_by_hashtag(hashtag)
      if hashtag.nil? || !hashtag.include?('railsgirls')
        InstagramClient.new(session[:access_token]).search('railsgirls')
      else
        InstagramClient.new(session[:access_token]).search(hashtag)
      end
    end
end
