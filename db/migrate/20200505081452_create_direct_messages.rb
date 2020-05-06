# frozen_string_literal: true

class CreateDirectMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_messages do |t|
      t.string :content
      t.references :user, index: true
      t.references :room, index: true

      t.timestamps
    end
  end
end
