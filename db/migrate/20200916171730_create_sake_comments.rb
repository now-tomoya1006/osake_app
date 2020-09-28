class CreateSakeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sake_comments do |t|
      t.integer :sake_id
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
