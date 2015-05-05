class Blog < ActiveRecord::Base
  has_many :blog_comments, :dependent => :destroy

  validates_presence_of :title, :published_date, :author, :content

  paginates_per 5

end
