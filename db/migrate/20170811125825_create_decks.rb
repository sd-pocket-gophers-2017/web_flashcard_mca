class CreateDecks < ActiveRecord::Migration[5.0]
  def change
  	  	create_table :Deck do |t|
  		t.string :name, null: false
  		 
  		t.timestamps
  end
end
