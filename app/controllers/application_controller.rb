class ApplicationController < Sinatra::Base

    configure do
        enable :sessions
        set :session_secret, "secret"
        set :views, "app/views"
      end

    helpers do
        def logged_in?
            !!current_user
        end
        
        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end

        def login(email, password)
            user = User.find_by(:email => email)
            if user && user.authenticate(password)
                session[:email] = user.email 
            else
                redirect "/login"
            end
        end

        def logout
            session.clear
        end
    end
    
end