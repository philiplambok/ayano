class Api::UsersController < ApplicationController
  before_action :find_all_users, only: [:index]
  before_action :set_user, only: [:show, :blogs, :role]
  before_action :validate_availability_user, only: [:show, :blogs, :role]

  def index
    json_response(@users)
  end

  def show 
    json_response(@user)
  end

  def blogs
    json_response(@user.blogs)
  end

  def role
    json_response(@user.role)
  end

  private 
  def find_all_users 
    @users = User.all
  end

  def set_user 
    @user = User.find_by_id(params[:id])
  end

  def validate_availability_user  
    error_response code: 404, message: "user not found" unless @user 
  end
end
