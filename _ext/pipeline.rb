Awestruct::Extensions::Pipeline.new do
  # extension Awestruct::Extensions::Posts.new( '/news' ) 
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Flattr.new
  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::GoogleAnalytics
end

