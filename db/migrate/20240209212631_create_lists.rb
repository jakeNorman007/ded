class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.text :title
      t.references :boards, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
