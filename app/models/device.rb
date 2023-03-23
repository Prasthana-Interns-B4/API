class Device < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user,optional: true
  before_create :status,:image_url,:user_id_check,:tag_no_assign
  before_update :status,:image_url,:user_id_check

  validates :tag_no,uniqueness: true
  validates :name,presence: true,length: {minimum: 3}
  validates :os,length: {minimum: 3}
  attribute :category,:string,default: "Goodies"
  attribute :image_url,:string,default: @@image_urls["default"]
  scope :search_bar, ->(search) {where("name ILIKE ? OR tag_no ILIKE ? OR device_type ILIKE ?","%#{search}%","%#{search}%","%#{search}%")}
=======
  belongs_to :user, optional: true
  before_create :status, :image_url, :tag_no_assign
  before_update :status, :image_url

  validates :tag_no, uniqueness: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :os, length: { minimum: 3 }
  attribute :category, :string, default: "Electronics"
  attribute :image_url, :string, default: @@image_urls["default"]
  scope :search,
        ->(search) {
          where(
            "name ILIKE ? OR tag_no ILIKE ? OR device_type ILIKE ?",
            "%#{search}%",
            "%#{search}%",
            "%#{search}%"
          )
        }
>>>>>>> dev

  def image_url
    self.image_url = @@image_urls[self.device_type.downcase]
  end

  def tag_no_assign
<<<<<<< HEAD
    id = Device.last.present? ? Device.last.id+1 : 1
=======
    id = Device.last.present? ? Device.last.id + 1 : 1
>>>>>>> dev
    self.tag_no = "DEV-" + "#{"%03d" % id}"
  end

  def status
<<<<<<< HEAD
     self.status = self.user_id.present? && self.user_id != 0 ? true : false
  end

  def user_id_check
    @user = User.where(id: self.user_id).blank?
    raise "User record not found" if @user && !!self.user_id
=======
    self.status = self.user_id.present? && self.user_id != 0 ? true : false
>>>>>>> dev
  end
end
