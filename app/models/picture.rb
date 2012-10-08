class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :captured_image, :exif_data
  has_attached_file :captured_image, :styles => { :medium => "200x200>" }
  include ExifData

	def exif
  	if exif_data
  		@ed ||= Marshal::load(exif_data)
  	else
  		@ed ||= MiniExiftool.new captured_image.path
  		# serialize and store in DB as this operation is expensive (means we do not support changes in exif data)
  		self.update_attribute(:exif_data, Marshal::dump(@ed))
  	end
		@ed
	end

	def lat
		@latitude ||= sexagesimal_to_decimal(exif.gpslatitude)
	end

	def long
		@longitude ||= sexagesimal_to_decimal(exif.gpslongitude)
	end

	def map_url
		"http://maps.google.com/maps/api/staticmap?size=300x300&maptype=hybrid&zoom=12&markers=color:blue|label:here|#{lat.to_s},#{long.to_s}&sensor=false"
	end

end