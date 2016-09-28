class Property < ApplicationRecord
	belongs_to :user
	belongs_to :postflats
	has_many :flats
	has_many :documents
	has_many :whiteboards
	has_many :ownerhistories

	

	mount_uploader :property_image, PropertyImageUploader

	validates_integrity_of :property_image
    validates_processing_of :property_image
    private

	def avatar_size_validation
		errors[:property_image] << "Should be less than 1000KB" if property_image.size > 1.megabytes
	end
end
