class Api::V1::AdoptersController < ApplicationController
  def index
    @adopters= Adopter.all
    render json: @adopters
  end

  def show
    @adopter = Adopter.find(adopter_params[:id])
    render json: @adopter
  end

  def create
    @adopter = Adopter.find_or_create_by(adopter_params)
    render json: @adopter
  end

  def update
    @adopter = Adopter.find(adopter_params[:id])
    @adopter.update(adopter_params)
    @adopter.save
    render json: @adopter
  end

  def destroy
    @adopter = Adopter.find(adopter_params[:id])
    @adopter.destroy
  end

  private

  def adopter_params
    params.permit(:id, :name, :sex, :age, :location, :residence_type, :allergy, :pets, :img_url)
  end

end
