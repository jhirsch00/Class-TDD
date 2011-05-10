class Photo < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :image, :styles => { :thumb => "100x100>" }
  
  validates :title, :presence => true
  validates :gallery_id, :presence => true
  
end
