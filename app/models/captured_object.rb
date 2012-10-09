class CapturedObject
	attr_reader :list

	def initialize
		@list ||= Array.new

		@list.concat(Picture.all).concat(Note.all)
		@list.sort! {|x,y| x.created_at <=> y.created_at}
	end

end