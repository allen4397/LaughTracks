class Comedian < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :age
  has_many :specials

  def self.average_age
    Comedian.average(:age)
  end

  def self.unique_cities
    cities = Comedian.select(:city).distinct.map {|comedian| comedian.city }
    cities.join", "
  end
end
