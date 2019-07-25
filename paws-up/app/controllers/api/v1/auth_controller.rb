
class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    adopter = Adopter.find_by(username: adopter_login_params[:username])
    if adopter && adopter.authenticate(adopter_login_params[:password])
       token = encode_token({ adopter_id: adopter.id })

       render json: { adopter: AdopterSerializer.new(adopter), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def adopter_login_params
    params.require(:adopter).permit(:username, :password)
  end

end
