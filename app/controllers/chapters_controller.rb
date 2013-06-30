class ChaptersController < ApplicationController

  before_filter :heroku_cache

  def index
    @content = File.open("public/books/3.2/index.html").read
  end

  def show
    chapter = params[:id]
    @content = File.open("public/books/3.2/#{chapter}_fragment.html").read
  end

  def old
    # redirect to the corresponding page if visited old URL
    chapter = params[:chapter]
    format  = params[:format]
    if File.exist?("public/books/3.2/#{chapter}_fragment.html")
      redirect_to "/chapters/#{chapter}.#{format}"
    else
      redirect_to "/"
    end
  end

end