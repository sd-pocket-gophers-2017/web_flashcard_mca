class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.string :user_name, null: false, unique: true
  		# change the password column to hashed_password
      t.string :password, null: false

  		t.timestamps
    end
  end
end
