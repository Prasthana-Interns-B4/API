class V1::DevicesController < ApplicationController
  include ActionController::Serialization
  before_action :user_authorization
  load_and_authorize_resource
  def index
    devices = Device.search_bar(params[:query]).accessible_by(current_ability)
    render json: devices
  end

  def show
    device = device_search
    render json: device
  end

  def create
    device = Device.create(device_params)
    result = device.persisted? ? device : device.errors
    render json: result
  end

  def update
    device = device_search.update!(device_params)
    render json: device_search
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
