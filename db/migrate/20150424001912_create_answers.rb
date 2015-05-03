class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :issue_id      
      t.text :answertext
      t.integer :score
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
