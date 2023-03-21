class DeviceSerializer < ActiveModel::Serializer
  attributes :user_name,:user_id,:name,:device_type,:build,:category,:tag,:image_url,:status_of_device
	belongs_to :user
  def status_of_device
    if self.object.status == true
      "Assigned"
    else
      "Unassigned"
    end
  end
  def tag
    Device.find(self.object.id).tag_no
  end

  def user_name
    if self.object.status == true
      @user=UserDetail.find_by_user_id(self.object.user_id)
      "#{@user.first_name} #{@user.last_name}"
    else
      "None"
    end
  end
end
