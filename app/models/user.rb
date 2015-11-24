class User < ActiveRecord::Base
    before_save {self.email = email.downcase}
    # has_many :microposts
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,   presence: true,
                        length: {maximum: 150},
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: {case_sensitive: false}
    validates :name, length: {maximum: 130}, presence: true
    
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
end
