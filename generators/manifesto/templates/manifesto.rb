class Manifesto < ActiveRecord::Base
  has_many :signatures
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :author, :message => "can't be blank"
  validates_presence_of :email, :message => "can't be blank"
  validates_presence_of :description, :message => "can't be blank"
end
