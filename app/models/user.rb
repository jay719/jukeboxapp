class User < ActiveRecord::Base
    has_many :reviews
    has_many :songs, through: :reviews
end