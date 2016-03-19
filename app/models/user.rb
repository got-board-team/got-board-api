class User < ActiveRecord::Base
  has_many :players

  validates_presence_of :email
end
