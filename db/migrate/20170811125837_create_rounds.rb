class CreateRounds < ActiveRecord::Migration[5.0]
  def change
  	  	create_table :Round do |t|
  		 
  		t.timestamps
  end
end
