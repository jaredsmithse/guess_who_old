# == Schema Information
#
# Table name: guesses
#
#  id                  :integer          not null, primary key
#  employee_id         :integer          not null
#  guessed_employee_id :integer          not null
#  correct             :boolean          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  correct_employee_id :integer          not null
#
# Indexes
#
#  index_guesses_on_employee_id  (employee_id)
#

class Guess < ApplicationRecord
  validates :employee, presence: true
  validates :guessed_employee, presence: true
  validates :correct_employee, presence: true
  validates :correct, presence: true

  belongs_to :employee
  belongs_to :guessed_employee, foreign_key: :guessed_employee_id, class_name: 'Employee'
  belongs_to :correct_employee, foreign_key: :correct_employee_id, class_name: 'Employee'
end
