class Api::V1::AdoptersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { adopter: AdopterSerializer.new(current_adopter) }, status: :accepted
  end

  def index
    @adopters= Adopter.all
    render json: @adopters
  end

  # def show
  #   @adopter = Adopter.find(params[:id])
  #   render json: @adopter
  # end

  def create
    adopter = Adopter.create(name: params[:name], username: params[:username].downcase  , password: params[:password], age: params[:age], location: params[:location], residence_type: params[:residence_type], allergy: params[:allergy], other_pets: params[:other_pets], img_url: params[:img_url] )
    # byebug
    if adopter.valid?
      @token = encode_token(adopter.id)
      render json: {adopter: AdopterSerializer.new(adopter), token: @token }, status: :created
    else
      render json: { error: 'failed to create adopter - this username is already taken' }, status: :not_acceptable
    end
  end

  # def update
  #   @adopter = Adopter.find(params[:id])
  #   @adopter.update(params)
  #   @adopter.save
  #   render json: @adopter
  # end

  def destroy
    @adopter = Adopter.find(params[:id])
    @adopter.destroy
  end

end
