class Project < ActiveRecord::Base
  validates :url, :presence => true
  validates :description, :presence => true
  validates :title, :presence => true


  belongs_to :skill
end
