class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false

      t.timestamps null: false
    end
  end
end
