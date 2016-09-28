class User < ApplicationRecord

	has_many :properties
	has_many :flats
	has_many :documents
	has_many :tickets
	has_many :replies
	has_many :ownerhistories
	has_many :mainhistories
	belongs_to :cpanel
   	belongs_to :role
  	before_create :set_default_role
  	mount_uploader :avatar, AvatarUploader

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_integrity_of :avatar
    validates_processing_of :avatar

  	acts_as_messageable

	

	def mailboxer_email(object)
		self.email
	end
	def mailboxer_name
		self.name
	end

	private
	def set_default_role
		self.role ||= Role.find_by_name('flat owner')
	end

	def avatar_size_validation
		errors[:avatar] << "Should be less than 500KB" if avatar.size > 0.5.megabytes
	end
end
