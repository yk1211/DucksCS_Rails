class ModifyPosts2 < ActiveRecord::Migration
  def change
    add_column :posts, :level, :string
    add_column :posts, :hw, :string
    add_column :posts, :project, :string
    add_column :posts, :language, :string
    add_column :posts, :mid, :string
    add_column :posts, :final, :string
  end
end
