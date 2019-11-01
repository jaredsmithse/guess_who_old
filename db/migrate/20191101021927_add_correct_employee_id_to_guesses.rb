class AddCorrectEmployeeIdToGuesses < ActiveRecord::Migration[6.0]
  def change
    change_table(:guesses) do |t|
      t.integer :correct_employee_id, null: false
    end
  end
end
