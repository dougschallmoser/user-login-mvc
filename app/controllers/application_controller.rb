class ApplicationController < Sinatra::Base

    set :views, "app/views"

    helpers do

        def logged_in?
            !!session[:user_id]
        end

        def login 
        end

        def current_user
        end
        
    end
    
end