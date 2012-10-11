module ExifData
	def sexagesimal_to_decimal(sexagesimal)
		degrees = 0
		if sexagesimal
			sexagesimals = sexagesimal.scan(/\d+/)
			degrees = sexagesimals[0].to_f + (sexagesimals[1].to_f / 60) + ((sexagesimals[2]+'.'+sexagesimals[2]).to_f / 3600)
			degrees = degrees * -1 if (sexagesimal.end_with?("W") || sexagesimal.end_with?("S"))
		end
		return degrees
	end
end