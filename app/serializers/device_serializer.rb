class DeviceSerializer < ActiveModel::Serializer
  attributes :id,:user_name,:user_id,:name,:device_type,:os,:category,:tag_no,:image_url,:status_of_device

  def status_of_device
    if self.object.status == true
      "Assigned"
    else
      "Unassigned"
    end
  end

  def user_name
    if self.object.status == true
      user=UserDetail.find(self.object.user_id)
      "#{user.first_name}"
    else
      "None"
    end
  end
end
