class V1::DevicesController < ApplicationController
  include ActionController::Serialization
  before_action :user_authorization
  load_and_authorize_resource
  before_action :device_search,only: %i[destroy update show]

  def index
    devices = Device.accessible_by(current_ability).search_bar(params[:search])
    render json: {"devices": devices},status: 200,except: %i[created_at updated_at]
  end

  def show
    render json: @device,status: 200
  end

  def create
    device = Device.create!(device_params)
    render json: device,status: 201
  end

  def update
    @device.update!(device_params)
    render json: @device,status: 201
  end

  def destroy
    @device.destroy
    render json: {message: "Successfully removed from Devices List"},status: 200
  end

  private
  #can can can gem passing mass params
  def device_params
    params.permit(:name,:device_type,:os,:category,:user_id)
  end

  def device_search
    @device = Device.find(params[:id])
  end
end
