class PostsController < ApplicationController

    get '/' do
        erb :index
    end

    get '/posts' do
        @posts = Post.all
        erb :"posts/index"
    end

    get '/posts/new' do
        if logged_in?
            erb :"posts/new"
        else 
            redirect "/login"
        end
    end

    post '/posts' do 
        post = Post.new(params[:post])
        post.save
        redirect "/posts/#{post.id}"
    end

    get '/posts/:id' do 
        @post = Post.find_by_id(params[:id])
        erb :"posts/show"
    end

end 