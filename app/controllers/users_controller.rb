class UsersController < ApplicationController
    
    get '/signup' do
        erb :"users/new"
    end 

    post '/users' do 
        @user = User.new(params[:user])
        if @user.save
            redirect "/login"
        else 
            erb :"users/new"
        end
    end

end