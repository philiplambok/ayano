module AuthHelper
  def generate_token(user)
    payload = { user_id: user.id }
    JWT.encode payload, nil, 'none'
  end

  def decode_token(token)
    JWT.decode token, nil, false
  end

  def authenticated?
    return false unless validate_headers
    return false unless validate_token

    # returns true is pass validation 
    true
  end

  def validate_headers 
    auth_headers = request.authorization

    # headers must be not empty
    return false unless auth_headers

    # split headers to arrays 
    auth_headers = auth_headers.split

    # headers must have 2 items 
    return false unless auth_headers.count == 2 

    # headers[0] must be return string "Bearer"
    return false unless auth_headers[0] == "Bearer"
    
    # returns true if pass validations 
    true
  end

  def validate_token
    # check avaiability user_id 
    return false unless user_id

    # returns true if pass validations 
    true
  end

  def token
    request.authorization.split[1]
  end

  def user_id
    begin
      decode_token(token)[0]["user_id"]
    rescue
      nil 
    end
  end

  def current_user
    current_user ||= User.find_by_id(user_id)
  end
end
