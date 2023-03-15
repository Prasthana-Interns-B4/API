class Device < ApplicationRecord
  belongs_to :employee,optional: true
  before_create :status,:image_url,:employee_id_check,:tag_no_assign
  before_update :status,:image_url,:employee_id_check

  validates :name,:tag_no,uniqueness: true
  attribute :category,:string,default: "Goodies"
  scope :search_bar, ->(search) {where("name ILIKE ? OR tag_no ILIKE ? OR device_type ILIKE ?","%#{search}%","%#{search}%","%#{search}%").all}

  def image_url
    self.image_url = @@image_urls[self.device_type.downcase]
  end

  def tag_no_assign
    id = Device.last.present? ? Device.last.id+1 : 1
    self.tag_no = "DEV-" + "#{"%03d" % id}" #"#{(id).to_s.rjust(3,'0')}"
  end

  def status
     self.status = self.employee_id.present? && self.employee_id != 0 ? true : false
  end

  def employee_id_check
    @employee = Employee.where(id: self.employee_id).blank?
    raise "Employee record not found" if @employee && !!self.employee_id
  end
end
