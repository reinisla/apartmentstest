class Document < ActiveRecord::Base
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   belongs_to :property
   belongs_to :user

   validates_presence_of :attachment, :name
end