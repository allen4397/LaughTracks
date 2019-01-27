class Special < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :comedian

  def self.average_run_time
    Special.average(:run_time).round(2)
  end
end
