class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 25, null: false
      t.string :avatar, null: false
      t.string :occupation, limit: 50, null: false

      t.timestamps
    end
  end
end
