class AddAttachmentCapturedImageToImages < ActiveRecord::Migration
	def change
    add_attachment :pictures, :captured_image
  end
end
