class V1::DevicesController < ApplicationController
  before_action :user_authorization
  load_and_authorize_resource
  before_action :device_search,only: %i[destroy update show assign unassign]

  def index
<<<<<<< HEAD
    devices = Device.accessible_by(current_ability).search_bar(params[:search])
    render json: devices,status: :ok,each_serializer: DeviceSerializer, include: '**'
  end

  def show
    render json: @device,status: :ok, serializer: DeviceSerializer, include: '**'
=======
    devices = Device.accessible_by(current_ability).search(params[:search])
    render json: devices,status: :ok,each_serializer: DeviceSerializer,include: ['user.user_detail']
  end

  def show
    render json: @device,status: :ok,serializer: DeviceSerializer,include: ['user.user_detail']
>>>>>>> dev
  end

  def create
    device = Device.create!(device_params)
    render json: device,status: :created,serializer: DeviceSerializer
  end

  def update
    @device.update!(device_params)
    render json: @device,status: :created,serializer: DeviceSerializer
  end

  def destroy
    @device.destroy
    head :no_content
  end

  def assign
    @device.update!(user_id: device_params[:user_id])
    render json: @device,status: :created,serializer: DeviceSerializer
  end

  def unassign
    @device.update!(user_id: nil)
    head :ok
  end

  private

  def device_params
    params.require(:device).permit(:name,:device_type,:os,:category,:user_id)
  end

  def device_search
    @device = Device.find(params[:id])
  end
end
