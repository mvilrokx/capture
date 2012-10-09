class CapturedObjectsController < ApplicationController
	respond_to :html

	def index
		@list = CapturedObject.new.list
    respond_with(@list, :layout => !request.xhr?)
	end

end
