class Account < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  validates_uniqueness_of :email, :case_sensitive => true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
