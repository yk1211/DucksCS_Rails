class Post < ActiveRecord::Base
  belongs_to :author, class_name: "Member", foreign_key: "member_id"

  validates :term, :campus, :title, :level,  :rate, presence: true


end
