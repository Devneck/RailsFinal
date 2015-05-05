class Article < ActiveRecord::Base
  validates_presence_of :title, :author, :content, :thumbnail

  paginates_per 8

  def proper_title
    title.titleize
  end
end
