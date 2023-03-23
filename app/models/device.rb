class Device < ApplicationRecord
  belongs_to :user, optional: true
  before_create :status, :image_url, :tag_no_assign
  before_update :status, :image_url

  validates :tag_no, uniqueness: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :os, length: { minimum: 3 }
  attribute :category, :string, default: "Electronics"
  attribute :image_url, :string, default: @@image_urls["default"]
  scope :search,
        ->(search) { !search ? Device.all :
          where(
            "name ILIKE ? OR tag_no ILIKE ? OR device_type ILIKE ?",
            "%#{search}%",
            "%#{search}%",
            "%#{search}%"
          )
        }

  def image_url
    self.image_url = @@image_urls[self.device_type&.downcase]
  end

  def tag_no_assign
    id = Device.last.present? ? Device.last.id + 1 : 1
    self.tag_no = "DEV-" + "#{"%03d" % id}"
  end

  def status
    self.status = self.user_id.present? && self.user_id != 0 ? true : false
  end
end