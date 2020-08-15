class ApplicationController < Sinatra::Base

    set :views, "app/views"

    helpers do

        def logged_in?
            !!current_user
        end

        def login 
        end

        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end
        
    end
    
end