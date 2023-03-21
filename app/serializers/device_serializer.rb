class DeviceSerializer < ActiveModel::Serializer

  attributes :id,:user_id,:name,:device_type,:os,:category,:tag_no,:image_url,:status
  belongs_to :user
end
