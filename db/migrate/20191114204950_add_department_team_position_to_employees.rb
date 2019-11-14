class AddDepartmentTeamPositionToEmployees < ActiveRecord::Migration[6.0]
  def change
    change_table(:employees) do |t|
      t.references :position
      t.references :team
      t.references :department
    end
  end
end
