class GuessService
  def initialize(employee)
    @employee = employee
  end

  def employees_to_guess
    @employees_to_guess ||= employees_at_location&.
      where&.not(id: correct_employee.id)&.
      limit(3)&.
      to_a&.
      append(correct_employee)&.
      shuffle
  end

  def correct_employee
    @correct_employee ||= employees_at_location&.limit(1)&.first
  end

  def employees_at_location
    @employees_at_location ||= @employee.
      location&.
      employees&.
      where&.not(id: @employee.id)&.
      order("RANDOM()")
  end
end