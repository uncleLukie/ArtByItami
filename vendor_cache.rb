require 'jekyll-include-cache'
Jekyll::Hooks.register :site, :after_init do |site|
  Jekyll::IncludeCache::INCLUDE_CACHE.clear
end