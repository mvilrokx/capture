class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :captured_image, :exif_data
  has_attached_file :captured_image, :styles => { :medium => "200x200>" }

	def exif
		# I think this is really slow so might be worth caching somehow
		@exif_date ||= MiniExiftool.new self.captured_image.path
	end

	def lat
		sexagesimal_to_decimal(exif.gpslatitude)
	end

	def long
		sexagesimal_to_decimal(exif.gpslongitude)
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