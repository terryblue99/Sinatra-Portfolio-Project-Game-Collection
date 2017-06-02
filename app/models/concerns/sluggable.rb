module Slugable
	module ClassMethods
		def find_by_slug(slug)
		self.all.find{ |instance| instance.slug == slug}
	end
	end

	module InstanceMethods
		def slug
		self.name.downcase.gsub(" ", "-")
	end
	end

end