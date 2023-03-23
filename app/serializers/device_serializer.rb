class DeviceSerializer < ActiveModel::Serializer
  attributes :id,:employee_name,:employee_id,:name,:device_type,:build,:category,:tag,:image_url,:status_of_device


end
