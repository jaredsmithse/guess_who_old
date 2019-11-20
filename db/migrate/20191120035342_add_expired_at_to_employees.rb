class AddExpiredAtToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :expired_at, :date
  end
end
