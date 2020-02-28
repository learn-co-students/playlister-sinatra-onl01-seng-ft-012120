module Slugifiable

  module ClassMethod
    def find_by_slug(slug)
      name = slug.gsub('-',' ').titleize
      self.all.find{|object| object.slug == slug}
    end
  end

  module InstanceMethod
    def slug
        self.name.downcase.gsub(' ', '-')
      end
  end
  
end