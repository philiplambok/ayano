class ApplicationController < ActionController::API
  def json_response(object) 
    render json: object
  end
end
