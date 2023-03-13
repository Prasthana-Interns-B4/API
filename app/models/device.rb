class Device < ApplicationRecord
  belongs_to :employee,optional: true
  before_create :status
  before_update :status


  validates :name,:tag_no,uniqueness: true
  attribute :category,:string,default: "goodie"


  def status
     self.status = self.employee_id.present? ? true : false
  end
end
