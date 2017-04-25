class Blog < ApplicationRecord
	 mount_uploader :image,  ImageUploaderUploader
	  mount_uploader :vedio,  VideoUploader
	  mount_uploader :document,  ImageUploaderUploader

	 # attr_accessor :option
	 has_many :comments, dependent: :destroy
	 has_many :images,  dependent: :destroy
	 accepts_nested_attributes_for :images
end
