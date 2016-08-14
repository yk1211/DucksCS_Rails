class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :title, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false

      t.timestamps null: false
    end
  end
end
