class DeviseCreateContributors < ActiveRecord::Migration
  def change
    create_table(:contributors) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.confirmable

      t.string :first_name
      t.string :last_name
      t.boolean :coordinator_approved

      t.timestamps
    end

    add_index :contributors, :email,                :unique => true
    add_index :contributors, :reset_password_token, :unique => true
    add_index :contributors, :confirmation_token,   :unique => true
  end

end
