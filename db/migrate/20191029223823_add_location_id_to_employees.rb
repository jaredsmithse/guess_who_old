class AddLocationIdToEmployees < ActiveRecord::Migration[6.0]
  def change
    change_table(:employees) do |t|
      t.references :location
    end
  end
end
