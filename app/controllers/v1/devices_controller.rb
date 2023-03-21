class V1::DevicesController < ApplicationController
  before_action :user_authorization
  load_and_authorize_resource
  before_action :device_search,only: %i[destroy update show]

  def index
    devices = Device.accessible_by(current_ability).search_bar(params[:search])
    render json: devices,status: :ok,each_serializer: DeviceSerializer,include: ['user.user_detail']
  end

  def show
    render json: @device,status: :ok,each_serializer: DeviceSerializer,include: ['user.user_detail']
  end

  def create
    device = Device.create!(device_params)
    render json: device,status: :created,each_serializer: DeviceSerializer
  end

  def update
    @device.update!(device_params)
    render json: @device,status: :created,each_serializer: DeviceSerializer
  end

  def destroy
    @device.destroy
    head :no_content
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
