class Cpanel < ApplicationRecord
	has_many :users
	has_many :properties
	has_many :flats

end
