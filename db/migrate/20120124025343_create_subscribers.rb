class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :private_code

      t.timestamps
    end

    add_index :subscribers, :email
    add_index :subscribers, :private_code
  end
end
