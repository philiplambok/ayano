class User < ApplicationRecord
  has_secure_password
  
  belongs_to :role 

  has_many :blogs
  
  paginates_per 10

  def admin? 
    role_id == 1 ? true : false 
  end
end
