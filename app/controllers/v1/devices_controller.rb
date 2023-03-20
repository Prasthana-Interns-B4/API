class V1::DevicesController < ApplicationController
  include ActionController::Serialization
  before_action :user_authorization
  load_and_authorize_resource
  def index
    devices = Device.search_bar(params[:search]).accessible_by(current_ability)
    render json: devices,status: 200
  end

  def show
    device = device_search
    render json: device,status: 200
  end

  def create
    device = Device.create(device_params)
    result = device.persisted? ? device : device.errors
    render json: result
  end

  def update
    device = device_search.update!(device_params)
    render json: device_search,status: 202
  end

  def destroy
    device = device_search.destroy
    render json: {message: "Successfully removed from Devices"},status: 200
  end


  private
#can can can gem passing mass params
  def device_params
    params.permit(:name,:device_type,:os,:category,:user_id)
  end

  def device_search
    Device.find(params[:id])
  end
end
