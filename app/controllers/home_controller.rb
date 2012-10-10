class HomeController < ApplicationController
	respond_to :html

	def index
		respond_with(@list, :layout => !request.xhr?)
	end

end
