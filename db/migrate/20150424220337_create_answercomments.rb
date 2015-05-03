class CreateAnswercomments < ActiveRecord::Migration
  def change
    create_table :answercomments do |t|
      t.integer :answer_id
      t.integer :user_id
      t.text :answercommenttext

      t.timestamps null: false
    end
  end
end
