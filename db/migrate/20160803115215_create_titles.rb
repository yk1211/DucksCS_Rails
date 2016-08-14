class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|

      t.timestamps null: false
    end
  end
end
