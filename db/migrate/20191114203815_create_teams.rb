class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :company, null: false

      t.timestamps null: false
    end
  end
end
