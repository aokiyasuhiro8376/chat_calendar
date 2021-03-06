# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, index: true
      t.references :room, index: true

      t.timestamps
    end
  end
end
