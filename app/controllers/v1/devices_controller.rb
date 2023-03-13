class V1::DevicesController < ApplicationController

  def index
    @device = Device.all
    render json: @device
  end

  def show
    @device = Device.where(id: params[:id])
    render json: @device
  end

  def create
    @device = Device.create(parameters)
    @result = @device.persisted? ? @device : "Providing data which existing in database"
    render json: @result
  end


  def update
    @device = Device.where(id: )&.update(parameters)
    render json: @device
  end

  def destroy
    @device =
    render json: {message: "Successfully removed from database"} if @device.destroy
  end

  private
  def device_id
    Device.find(id: params[:id])
  end
  def parameters
    params.permit(:name,:device_type,:build,:category,:tag_no,:employee_id)
  end
end
