class Role < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
=======
  validates :role,presence: true
>>>>>>> dev
end
