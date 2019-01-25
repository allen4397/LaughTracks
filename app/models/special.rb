class Special < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :comedian
end
