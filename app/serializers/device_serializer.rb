class DeviceSerializer < ActiveModel::Serializer
  attributes :id,:employee_assigned,:name,:device_type,:build,:tag_no,:category,:image_url,:status_of_device

  def status_of_device
    if self.object.status == true
      "Assigned"
    else
      "Unassigned"
    end
  end

  def employee_assigned
    if self.object.status == true
      "#{self.object.employee_id}"
    else
      "None"
    end
  end

end
