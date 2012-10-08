class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :captured_image
  has_attached_file :captured_image, :styles => { :medium => "200x200>" }

 #  after_post_process :extract_exif

	# def extract_exif
	# 	puts captured_image_file_name
	# 	#puts captured_image_url
	# 	puts self.captured_image.path
	# 	puts captured_image.queued_for_write[:original].path
	# 	image = MiniExiftool.new captured_image.queued_for_write[:original].path
	# 	ap image
 # 		puts image['DateTimeOriginal']
	# end

	def exif
		image = MiniExiftool.new self.captured_image.path
	end

	def long
		sexagesimal_to_decimal(exif.gpslongitude)
	end

	def lat
		sexagesimal_to_decimal(exif.gpslatitude)
	end

	def map_url
		"http://maps.google.com/maps/api/staticmap?size=300x300&maptype=hybrid&zoom=12&markers=color:blue|label:here|#{lat.to_s},#{long.to_s}&sensor=false"
	end

	protected
		def sexagesimal_to_decimal(sexagesimal)
			sexagesimals = sexagesimal.scan(/\d+/)
			degrees = sexagesimals[0].to_f + (sexagesimals[1].to_f / 60) + ((sexagesimals[2]+'.'+sexagesimals[2]).to_f / 3600)
			degrees = degrees * -1 if (sexagesimal.end_with?("W") || sexagesimal.end_with?("S"))
			return degrees
		end
end