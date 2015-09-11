class PagesController < ApplicationController
  respond_to :json, only: :search
  respond_to :html, only: :index

  def index
    if params[:hashtag].nil? || !params[:hashtag].include?('railsgirls')
      @pictures = InstagramClient.new.search('railsgirls')
    else
      @pictures = InstagramClient.new.search(params[:hashtag])
    end
  end

  def search
    if params[:hashtag].include? 'railsgirls'
      @pictures = InstagramClient.new.search(params[:hashtag])
    else
      @pictures = nil
    end
    respond_with json: @pictures
  end
end
