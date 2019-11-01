class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.belongs_to :employee, null: false
      t.integer :guessed_employee_id, null: false
      t.boolean :correct, null: false

      t.timestamps null: false
    end
  end
end
