# The expired_at column name was a bit vague, and was too close to
# the Google OAuth expires_at column name. This better describes the 
# meaning of what the column represents.
class RenameEmployeesExpiredAt < ActiveRecord::Migration[6.0]
  def change
    rename_column :employees, :expired_at, :left_at
  end
end
