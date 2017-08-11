class CreateCards < ActiveRecord::Migration[5.0]
  def change
  	  	create_table :Card do |t|
  		t.string :question, null: false
  		t.string :answer, null: false
  		 
  		t.timestamps
  end
end
