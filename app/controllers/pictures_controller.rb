class PicturesController < ApplicationController
	respond_to :html

	def index
		@pictures = Picture.paginate(:page => params[:page], :per_page => params[:per_page]||30)
    respond_with(@picture, :layout => !request.xhr?)
	end

	def new
		@picture = Picture.new
    respond_with(@picture, :layout => !request.xhr?)
	end
	
	def create
		@picture = Picture.create(params[:picture])
    if @picture.save
      redirect_to pictures_path, :flash => {:success => "Successfully saved picture."}
    else
      render :action => 'new', :notice => "An error occured during saving, please re-try."
    end	
  end

	def edit
    @picture = Picture.find(params[:id])
    respond_with(@picture, :layout => !request.xhr?)
  end

  def update
    @picture = Picture.find(params[:id])    
    if @picture.update_attributes(params[:picture])
      redirect_to pictures_path, :flash => {:success => "Successfully updated captured image."}
    else
      render :action => 'edit', :notice => "An error occured during saving, please re-enter."
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, :flash => {:success => "Successfully deleted image."}
  end

end
