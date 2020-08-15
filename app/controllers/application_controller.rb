class ApplicationController < Sinatra::Base

    set :views, "app/views"

    helpers do

        def logged_in?
            !!current_user
        end

        def login(email, password)
            user = User.find_by(:email => email)
            if user && user.authenticate(password)
                session[:email] = user.email 
            else
                redirect "/login"
            end
        end

        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end
        
    end
    
end