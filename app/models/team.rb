# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  company_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teams_on_company_id  (company_id)
#

class Team < ApplicationRecord
  validates :name, presence: true
  belongs_to :company
  has_many :employees
end
