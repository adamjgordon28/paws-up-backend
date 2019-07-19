class Api::V1::AuthController < ApplicationController
  def login
    user = Adopter.find_by(username:params[:username].downcase)
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: {errors: "Could not log in"}
    end
  end
end
