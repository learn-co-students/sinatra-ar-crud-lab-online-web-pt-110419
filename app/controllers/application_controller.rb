require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    id = params["id"]
    new_params = {}
    old_post = Post.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/posts/#{id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params["id"])
    @post.destroy
    erb :delete
  end
end