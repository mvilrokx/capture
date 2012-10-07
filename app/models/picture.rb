class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :captured_image
  has_attached_file :captured_image, :styles => { :medium => "300x300>" }
end
