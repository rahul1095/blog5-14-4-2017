class Blog < ApplicationRecord
	 mount_uploader :image,  ImageUploaderUploader
	  mount_uploader :vedio,  ImageUploaderUploader
	  mount_uploader :document,  ImageUploaderUploader

	 # attr_accessor :option
	 has_many :comments, dependent: :destroy
end
