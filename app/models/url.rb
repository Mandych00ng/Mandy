class Url < ActiveRecord::Base

	validates :long_url, uniqueness:{case_sensitive: false, message: "Bad link!"}
	validates :long_url, format:{with:(URI::regexp(['http', 'https']))}
	
	before_save :shorten

	def shorten
		self.short_url = SecureRandom.hex(6)
	end

end