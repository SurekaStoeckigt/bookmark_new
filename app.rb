require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  #enable method override so that  post request is overidden by value in method parameter (DELETE)
  get '/' do
    "Bookmark Manager!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    @bookmarks = Bookmark.all
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
