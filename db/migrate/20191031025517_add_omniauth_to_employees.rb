class AddOmniauthToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :provider, :string
    add_column :employees, :uid, :string
    add_column :employees, :token, :string
    add_column :employees, :expires_at, :integer
    add_column :employees, :expires, :boolean
    add_column :employees, :refresh_token, :string
    add_column :employees, :google_profile_photo_url, :string
  end
end
