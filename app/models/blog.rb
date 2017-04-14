class Blog < ApplicationRecord
	 mount_uploader :image,  ImageUploaderUploader
	 # attr_accessor :option
	 has_many :comments, dependent: :destroy
end
