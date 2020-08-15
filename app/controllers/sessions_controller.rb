class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/sessions' do
        login(params[:email], password[:password])
        redirect "/posts"
    end

    get '/logout' do 
        logout!
        redirect "/posts"
    end

end