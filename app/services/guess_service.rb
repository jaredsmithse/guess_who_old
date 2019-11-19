# frozen_string_literal: true

class GuessService
  def initialize(employee, correct_employee = nil)
    @employee = employee
    @correct_employee = correct_employee
  end

  def employees_to_guess
    @employees_to_guess ||= employees.
      where.not(id: [correct_employee.id, @employee.id]).
      limit(3).
      to_a.
      append(correct_employee).
      shuffle
  end

  def correct_employee
    @correct_employee ||= employees.where.not(id: @employee.id).order("RANDOM()").first
  end

  def employees
    @employee.company.employees
  end
end