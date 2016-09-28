class Flat < ApplicationRecord
	belongs_to :user
	belongs_to :properties
	belongs_to :postflats
	belongs_to :all_flats
	has_many :tickets
	has_many :ownerhistories
	has_many :mainhistories
	validates_presence_of :flat_nr, :name 
	
end

