class V1::DevicesController < ApplicationController
  #load_and_authorize_resource
  include ActionController::Serialization
  def index
    @device = Device.all #.accessible_by(current_ability)
    render json: @device,status: 200
  end

  def show
    @device = device_search
    render json: @device,status: 200
  end

  def create
    @device = Device.create(parameters)
    @result = @device.persisted? ? @device : @device.errors
    render json: @result,status: 200
  end

  def update
    @device = device_search.update(parameters)
    render json: device_search,status: 200
  end

  def destroy
    @device = device_search
    render json: {message: "Successfully removed from Device"} if @device.destroy
  end

  def search_implemention
    @device = Device.search_bar(params[:search])
    render json: @device,status: 200
  end

  private
  def device_search
    Device.find_by_id(params[:id])
  end

  def parameters
    params.permit(:name,:device_type,:build,:category,:tag_no,:employee_id)
  end
end
