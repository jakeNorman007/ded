class DropBoards < ActiveRecord::Migration[7.1]
  def change
    drop_table :boards
  end
end
