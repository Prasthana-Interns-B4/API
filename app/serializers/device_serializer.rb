class DeviceSerializer < ActiveModel::Serializer

  attributes :id,:user_id,:name,:device_type,:os,:category,:tag_no,:image_url,:status_of_device
  belongs_to :user

  def status_of_device
    if self.object.status == true
      "Assigned"
    else
      "Unassigned"
    end
  end
end
