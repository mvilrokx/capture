class CreateImages < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string :title 
    	t.text :description
    	t.text :exif   	
      t.timestamps
    end
  end
end