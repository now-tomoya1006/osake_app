class CreateSakes < ActiveRecord::Migration[5.2]
  def change
    create_table :sakes do |t|
      t.text :body
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
