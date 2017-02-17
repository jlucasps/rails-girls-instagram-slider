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
    return unless hashtag_allowed(params[:hashtag])
    @pictures = InstagramClient.new(ENV['INSTAGRAM_ACCESS_TOKEN']).search(params[:hashtag])
  end

  def hashtag_allowed(hashtag)
    !hashtag.nil? && (hashtag.include?('railsgirls') || hashtag.include?('blackgirlscode'))
  end
end
