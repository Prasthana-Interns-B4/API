class V1::DevicesController < ApplicationController
  #load_and_authorize_resource
  include ActionController::Serialization
  def index
    @device = Device.all #.accessible_by(current_ability)
    render json: @device
  end

  def show
    @device = device_search
    render json: @device
  end

  def create
    @device = Device.create(parameters)
    @result = @device.persisted? ? @device : @device.errors
    render json: @result
  end

  def update
    @device = device_search.update(parameters)
    render json: device_search
  end

  def destroy
    @device = device_search.destroy
    render json: {message: "Successfully removed from Devices"},status: 200
  end

  def search
    @device = Device.search_bar(params[:query])
    render json: @device
  end

  private
  def device_search
    Device.find(params[:id])
  end

  def parameters
    params.permit(:name,:device_type,:build,:category,:employee_id)
  end
end
