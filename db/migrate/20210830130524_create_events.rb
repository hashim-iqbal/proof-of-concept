# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :time, null: false
      t.integer :type, null: false
      t.decimal :revenue, null: false, precision: 8, scale: 2
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
