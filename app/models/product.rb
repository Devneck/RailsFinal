class Product < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy

  validates_presence_of :name, :description, :image, :thumb
  validates_numericality_of :sell_price, :cost, :stock, :weight

  paginates_per 5

  def proper_name
    name.titleize
  end

end
