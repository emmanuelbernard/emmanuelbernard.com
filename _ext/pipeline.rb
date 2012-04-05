Awestruct::Extensions::Pipeline.new do
  # extension Awestruct::Extensions::Posts.new( '/news' ) 
  extension Awestruct::Extensions::Posts.new('/blog', :posts)
  extension Awestruct::Extensions::Paginator.new( :posts, '/blog/index', :per_page=>10 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/blog/index', '/blog/tags', :per_page=>10 )
  extension Awestruct::Extensions::Atomizer.new( :posts, '/blog/blog.atom', :num_entries=>10000 )
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Indexifier.new
  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
end

