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
        post.user = current_user
        post.save
        redirect "/posts/#{post.id}"
    end

    get '/posts/:id' do 
        @post = Post.find_by(id: params[:id])
        erb :"posts/show"
    end

    get '/posts/:id/edit' do
        @post = Post.find_by(id: params[:id])
        if logged_in?
            if @post = current_user.posts.find_by(id: params[:id])
                erb :"posts/edit"
            else
                redirect "/posts"
            end
        else 
            redirect "/login"
        end
    end

    patch '/posts/:id' do
        @post = Post.find_by(id: params[:id])
        @post.update(params[:post])
        redirect "/posts/#{@post.id}"
    end

end 