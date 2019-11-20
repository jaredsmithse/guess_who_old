# frozen_string_literal: true
# == Schema Information
#
# Table name: employees
#
#  id                       :integer          not null, primary key
#  name                     :string           not null
#  email                    :string           default(""), not null
#  encrypted_password       :string           default(""), not null
#  reset_password_token     :string
#  reset_password_sent_at   :datetime
#  remember_created_at      :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  location_id              :integer
#  provider                 :string
#  uid                      :string
#  token                    :string
#  expires_at               :integer
#  expires                  :boolean
#  refresh_token            :string
#  google_profile_photo_url :string
#  company_id               :integer
#  position_id              :integer
#  team_id                  :integer
#  department_id            :integer
#  expired_at               :date
#
# Indexes
#
#  index_employees_on_department_id         (department_id)
#  index_employees_on_email                 (email) UNIQUE
#  index_employees_on_location_id           (location_id)
#  index_employees_on_position_id           (position_id)
#  index_employees_on_reset_password_token  (reset_password_token) UNIQUE
#  index_employees_on_team_id               (team_id)
#

class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true
  validates :email, presence: true

  belongs_to :location, optional: true
  belongs_to :company, optional: true
  has_many :guesses

  before_create :set_company_id

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
      employee.email = auth.info.email
      employee.expires = auth.credentials.expires
      employee.expires_at = auth.credentials.expires_at
      employee.google_profile_photo_url = auth.info.image
      employee.name = auth.info.name
      employee.refresh_token = auth.credentials.refresh_token
      employee.password = Devise.friendly_token[0, 20]
      employee.token = auth.credentials.token
    end
  end

  def email_domain
    @email_domain ||= email.split("@").last
  end

  private def set_company_id
    write_attribute :company_id, Company.find_by(email_domain: email_domain)&.id
  end
end
