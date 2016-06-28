class Url < ActiveRecord::Base
	
	def  self.generate_short_url(url)
		url.hash.abs.to_s(36)
	end

end