class Posts < ApplicationRecord
	belongs_to :user
	has_many :flats
	has_many :properties
end
