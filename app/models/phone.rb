class Phone < ApplicationRecord
  belongs_to :employer,optional: true
  after_update :send_pin!, if: "phone_changed?"

  validates :phone,uniqueness: true
  validates :phone ,presence: true


  def reset_pin!
   self.update_column(:pin, rand(1000..9999))
  end

  def unverify!
    self.update_column(:verified, false)
  end

  def send_pin!
    reset_pin!
    unverify!
  end
end
