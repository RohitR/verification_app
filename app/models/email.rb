class Email < ApplicationRecord
  before_create :confirmation_token
  belongs_to :employer,optional: true
  validates :email,uniqueness: true
  validates :email ,presence: true


  def email_activate
    self.confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
