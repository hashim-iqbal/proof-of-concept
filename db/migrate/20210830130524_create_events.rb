# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :time, null: false
      t.string :type, null: false
      t.integer :revenue, null: false
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
