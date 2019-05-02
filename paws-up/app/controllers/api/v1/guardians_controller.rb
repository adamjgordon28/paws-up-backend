class Api::V1::GuardiansController < ApplicationController
  def index
    @guardians= Guardian.all
    render json: @guardians
  end

  def show
    @guardian = Guardian.find(guardian_params[:id])
    render json: @guardian
  end

  def create
    @guardian = Guardian.find_or_create_by(guardian_params)
    render json: @guardian
  end

  def update
    @guardian = Guardian.find(guardian_params[:id])
    @guardian.update(guardian_params)
    @guardian.save
    render json: @guardian
  end

  def destroy
    @guardian = Guardian.find(guardian_params[:id])
    @guardian.destroy
  end

  private

  def guardian_params
    params.permit(:id, :name, :location, :img_url)
  end

end
