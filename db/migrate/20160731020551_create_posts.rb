class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :term, null: false                 # Term fall or spring, summer 2015
      t.string :section, null: false              # CS prefix course number like CS 501
      t.integer :campus, null: false, default: 0  # On campus or Web campus
      t.string :title, null: false                # Course title
      t.text :body, null: false                   # Course reviews
      t.integer :rate, null: false                # Course satisfaction rating (1 ~ 5)

      t.timestamps null: false
    end
  end
end
