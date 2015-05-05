class Movie < ActiveRecord::Base
  validates_presence_of :name, :director
  validates_numericality_of :year, :length

end
