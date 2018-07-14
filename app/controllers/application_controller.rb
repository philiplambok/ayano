class ApplicationController < ActionController::API
  include AuthHelper 
  
  def json_response(object) 
    render json: object
  end

  def error_response(options)
    error = { code: options[:code], message: options[:message] }

    render json: error 
  end
end
