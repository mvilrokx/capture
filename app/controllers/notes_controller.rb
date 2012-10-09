class NotesController < ApplicationController
	respond_to :html

	def index
		@notes = Note.paginate(:page => params[:page], :per_page => params[:per_page]||30)
    respond_with(@note, :layout => !request.xhr?)
	end

	def new
		@note = Note.new
    respond_with(@note, :layout => !request.xhr?)
	end

	def create
		@note = Note.create(params[:note])
    if @note.save
      redirect_to notes_path, :flash => {:success => "Successfully saved note."}
    else
      render :action => 'new', :notice => "An error occured during saving, please re-try."
    end
  end

	def edit
    @note = Note.find(params[:id])
    respond_with(@note, :layout => !request.xhr?)
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect_to notes_path, :flash => {:success => "Successfully updated captured note."}
    else
      render :action => 'edit', :notice => "An error occured during saving, please re-enter."
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, :flash => {:success => "Successfully deleted note."}
  end
end
