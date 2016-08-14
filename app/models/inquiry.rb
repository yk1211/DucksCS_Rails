class Inquiry < ActiveRecord::Base
  include ActiveModel::Model

  attr_accessor :title, :name, :email, :message

  validates :title, :presence => { :message => "Pleaset enter title" }
  validates :name, :presence => { :message => "Pleaset enter your name" }
  validates :email, :presence => { :message => "Please enter your email" }

end
