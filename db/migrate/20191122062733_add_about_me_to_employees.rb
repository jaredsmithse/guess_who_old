class AddAboutMeToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :about_me, :text
  end
end
