class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :User do |t|
  		t.string :user_name, null: false
  		t.string :password, null: false
  		 
  		t.timestamps
  end
end
