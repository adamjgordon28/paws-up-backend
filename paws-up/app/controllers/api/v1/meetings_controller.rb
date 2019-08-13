class Api::V1::MeetingsController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def index
    @meetings= Meeting.all
    render json: @meetings
  end

  def show
    @meeting = Meeting.find(meeting_params[:id])
    render json: @meeting
  end

  def create
    @meeting = Meeting.find_or_create_by(meeting_params)
    if @meeting.valid?
    render json: @meeting
    else
    render json: {errors: "Meeting cannot be in the past."}
    end
  end

  def update
    @meeting = Meeting.find(meeting_params[:id])
    @meeting.update(meeting_params)
    @meeting.save
    render json: @meeting
  end

  def destroy
    @meeting = Meeting.find(meeting_params[:id])
    @meeting.destroy
  end

  private

  def meeting_params
    params.permit(:id, :adopter_id, :pet_id, :datetime, :location)
  end

end
