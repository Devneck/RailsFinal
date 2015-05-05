class BlogComment < ActiveRecord::Base
  belongs_to :blog

  validates_presence_of :author, :content, :avatar
end
