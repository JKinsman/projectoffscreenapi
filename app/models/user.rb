class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_uniqueness_of :email
end
