class ModifyPosts1 < ActiveRecord::Migration
  def change
    add_column :posts, :member_id, :integer
  end
end
