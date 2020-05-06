# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :color
      t.boolean :allDay
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
