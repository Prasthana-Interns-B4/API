class DeviceSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:name,:device_type,:os,:category,:tag_no,:image_url,:status
<<<<<<< HEAD
  belongs_to :user, serializer: UserBasicSerializer
=======
  belongs_to :user
>>>>>>> dev
end
