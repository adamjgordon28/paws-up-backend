class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    # byebug
      JWT.encode(payload, ENV["jwt_secret"])
    end

    def auth_header
      request.headers['Authorization']
    end

    def decoded_token
      # byebug
      if auth_header()
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, ENV["jwt_secret"], true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def current_adopter
      # byebug
      if decoded_token()
        adopter_id = decoded_token[0]['adopter_id']
        @adopter = Adopter.find_by(id: adopter_id)
      else
        nil
      end
    end

    def logged_in?
        # byebug
      !!current_adopter
    end

    def authorized
        # byebug
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
