class UsersController > ApplicationController
    
    get '/signup' do
        erb :"users/new"
    end 

    post '/users' do 
        @user = User.new(params)
        if @user.save

end