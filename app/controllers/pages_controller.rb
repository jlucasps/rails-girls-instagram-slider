class PagesController < ApplicationController
  before_action :set_pictures
  respond_to :json, only: :search
  respond_to :html, only: :index

  def index
  end

  def search
    respond_with json: @pictures
  end

  private
    def set_pictures
      if params[:hashtag].include? 'railsgirls'
        @pictures = InstagramClient.new().search(params[:hashtag])
      else
        @pictures = nil
      end
    end
end
