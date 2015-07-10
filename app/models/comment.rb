class Comment < ActiveRecord::Base
  validates :description, :presence => true

  belongs_to :post
  belongs_to :user
end
