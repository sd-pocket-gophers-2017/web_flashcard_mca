class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
  	  	create_table :Guess do |t|
  	  t.integer :count		
  		 
  		t.timestamps
  end
end
