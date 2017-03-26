class Employer < ApplicationRecord
  has_secure_password
  has_one :phone,dependent: :destroy
  has_one :email,dependent: :destroy

  validates :name,:location,presence: true

  accepts_nested_attributes_for :phone,allow_destroy: true
  accepts_nested_attributes_for :email,allow_destroy: true

end
