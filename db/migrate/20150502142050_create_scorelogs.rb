class CreateScorelogs < ActiveRecord::Migration
  def change
    create_table :scorelogs do |t|
      t.integer :answerid
      t.integer :userid

      t.timestamps null: false
    end
  end
end
