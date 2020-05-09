class AddRoomRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :room, foreign_key: true
  end
end
