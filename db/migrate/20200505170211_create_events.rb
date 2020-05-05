class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.boolean :disp_flg
      t.datetime :start_time
      t.datetime :end_time
      t.string :allDay
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
