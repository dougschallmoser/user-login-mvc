class PostsController < ApplicationController

    get '/' do
        redirect "/posts"
    end

    get '/posts' do
        @posts = Post.all
        erb :index
    end

end 