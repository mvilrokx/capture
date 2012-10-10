class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :get_captured_objects

	def get_captured_objects
	  @list = CapturedObject.new.list
	end

end
