class CreateIssuecomments < ActiveRecord::Migration
  def change
    create_table :issuecomments do |t|
      t.integer :issue_id
      t.integer :user_id
      t.text :issuecommenttext

      t.timestamps null: false
    end
  end
end
