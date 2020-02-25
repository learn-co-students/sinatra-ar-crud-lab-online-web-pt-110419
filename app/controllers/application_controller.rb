
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all
    
    erb :index
  end 

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)

    redirect "/articles/#{@article.id}"
  end 

  get '/articles/:id' do
    
  end


end
