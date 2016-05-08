class User < ActiveRecord::Base
    has_many :subreddits, :dependent => :delete_all
    validates :username, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    
    before_save { username.downcase! }
    has_secure_password
end
