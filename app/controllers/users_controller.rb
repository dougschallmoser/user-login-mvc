class UsersController < ApplicationController
    
    get '/signup' do
        if !logged_in?
            erb :"users/new"
        else 
            redirect "/posts"
        end 
    end 

    post '/signup' do 
        @user = User.new(params[:user])
        if @user.save
            redirect "/login"
        else 
            erb :"users/new"
        end
    end

    get '/login' do
        if !logged_in?
            erb :"users/login"
        else 
            redirect "/posts"
        end
    end

    post '/login' do
        login(params[:email], params[:password])
        redirect "/posts"
    end

    get '/logout' do 
        if logged_in?
            logout
            redirect "/login"
        else 
            redirect "/"
        end
    end

end