class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
  	create_table :Guess do |t|
      t.integer :card_id
      t.integer :round_id
      t.string :is_correct

  		t.timestamps
    end
  end
end
