class Ticket < ApplicationRecord
	belongs_to :user
	belongs_to :flat
	has_many :replies
end
