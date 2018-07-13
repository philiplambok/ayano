class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  paginates_per 10
end
