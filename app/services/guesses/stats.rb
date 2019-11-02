module Guesses
  class Stats
    def initialize(employee)
      @employee = employee
    end

    def overall_guesses_pie_chart_data
      {
        correct: correct_guesses,
        incorrect: incorrect_guesses,
      }
    end

    def overall_guesses_line_chart_data
      [
        { 
          name: "Correct", 
          data: guesses.correct.group_by_day(:created_at).count,
        },
        { 
          name: "Incorrect", 
          data: guesses.incorrect.group_by_day(:created_at).count,
        },
      ]
    end

    def correctly_guessed_employees
      @correctly_guessed_employees ||= guesses.
        correct.
        group_by(&:correct_employee).
        transform_values(&:count)
    end

    def incorrectly_guessed_employees
      @incorrectly_guessed_employees ||= guesses.
        incorrect.
        group_by(&:correct_employee).
        transform_values(&:count)
    end

    def team_member_count
      @employee.company.employees.count
    end

    def total_guesses
      @total_guesses ||= guesses.count
    end

    def correct_guesses
      @correct_guesses ||= guesses.correct.count
    end

    def incorrect_guesses
      @incorrect_guesses ||= guesses.incorrect.count
    end

    def guesses
      @guesses ||= @employee.guesses
    end
  end
end