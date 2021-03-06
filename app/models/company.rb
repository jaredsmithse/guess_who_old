# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  email_domain :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ApplicationRecord
  validates :name, presence: true
  validates :email_domain, presence: true, uniqueness: true

  has_many :locations
  has_many :employees

  has_one_attached :logo
end
