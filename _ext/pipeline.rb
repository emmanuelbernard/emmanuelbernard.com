require 'tagger_sanitizer'
require 'atomizer_custom'

Awestruct::Extensions::Pipeline.new do
  # extension Awestruct::Extensions::Posts.new( '/news' ) 
  extension Awestruct::Extensions::Posts.new('/blog', :posts)
  extension Awestruct::Extensions::Paginator.new( :posts, '/blog/index', :per_page=>10 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/blog/index', '/blog/tags', :per_page=>10, :sanitize=>true )
  extension Awestruct::Extensions::TagCloud.new(:posts, '/blog/tags/index.html', :layout=>'tab', :title=>'Tags')
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( 
    :posts, 
    '/blog/feed-private.atom', 
    :num_entries=>10000,
    :content_url=>'http://emmanuelbernard.com/blog',
    :feed_title=> 'No Relation To' )
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Disqus.new
  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
end

