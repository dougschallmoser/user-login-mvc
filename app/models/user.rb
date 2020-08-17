class User < ActiveRecord::Base

    has_many :posts
    has_secure_password
    validates :email, :presence => true
    validates :name, :presence => true

    ## slugs would be here
    
end