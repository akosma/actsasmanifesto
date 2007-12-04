class Signature < ActiveRecord::Base
  belongs_to :manifesto, :counter_cache => true
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :email, :comment => "can't be blank"
  validates_presence_of :email_privacy, :message => "can't be blank"
  validates_length_of :email_privacy, :is => 1, :message => "is too long"
  validates_format_of :email_privacy, :with => /(i|m|a)/i, :message => "is a wrong value"
  
  def is_email_invisible_to_all
    email_privacy == "i"
  end

  def is_email_visible_to_all
    email_privacy == "a"
  end

  def is_email_visible_to_manifesto_author
    email_privacy == "m"
  end
  
  def self.valid_email_privacy_values
    {
      "Invisible to all (default)" => "i",
      "Visible only to manifesto author" => "m",
      "Visible to all (scrambled to avoid spam)" => "a"
    }
  end
end
