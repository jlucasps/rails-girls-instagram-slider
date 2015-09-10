class PagesController < ApplicationController
  respond_to :json, only: :search
  respond_to :html, only: :index

  def index
  end

  def search
    if params[:hashtag].include? 'railsgirls'
      @pictures = { a: 1, b: 2 }
    else
      @pictures = nil
    end
    respond_with json: @pictures
  end
end
