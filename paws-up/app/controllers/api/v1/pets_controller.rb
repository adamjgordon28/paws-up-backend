class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized

  def index
    @pets= Pet.all
    render json: @pets
  end

  def show
    # byebug
    @pet = Pet.find_by(id: pet_params[:id])
    render json: @pet
  end

  def create
    @pet = Pet.find_or_create_by(pet_params)
    render json: @pet
  end

  def update
    @pet = Pet.find(pet_params[:id])
    @pet.update(pet_params)
    @pet.save
    render json: @pet
  end

  def destroy
    @pet = Pet.find(pet_params[:id])
    @pet.destroy
  end

  private

  def pet_params
    params.permit(:id, :name, :sex, :animal, :age, :location, :allergy, :size, :img_url)
  end

end
