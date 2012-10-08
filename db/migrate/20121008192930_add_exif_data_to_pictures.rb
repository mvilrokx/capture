class AddExifDataToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :exif_data, :blob
  end
end
