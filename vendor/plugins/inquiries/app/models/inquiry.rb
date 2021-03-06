class Inquiry < ActiveRecord::Base

  validates_presence_of :name
  validates_format_of :email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => 'must be valid'

  acts_as_indexed :fields => [:name, :email, :message, :phone]

  named_scope :newest, :order => 'created_at DESC'

  def self.latest(number=7)
    newest.find(:all, :limit => number)
  end

end
