class Api::AuthController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :validate_authenticity_user, only: [:create] 
  before_action :set_token, only: [:create]
  
  def create
    json_response({ jwt: @token })
  end

  private 
  def set_user 
    @user = User.find_by_username(params[:auth][:username])
  end

  def validate_authenticity_user
    non_authenticated_message unless @user && @user.authenticate(params[:auth][:password])
  end

  def non_authenticated_message 
    error_response code: 401, message: "username or password is wrong"
  end

  def set_token
    @token = generate_token(@user)
  end
end
