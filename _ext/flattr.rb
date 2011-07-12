
require 'digest/sha1'

module Awestruct
  module Extensions
    class Flattr

      def execute(site)
        site.pages.each{|p| p.extend Flattrable }
      end

      module Flattrable
        def flattr_javascript()
          html = %Q|<script type='text/javascript'> /* <![CDATA[ */     (function() {\n|
          html += %Q|var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];|
          html += %Q|s.type = 'text/javascript';\n|
          html += %Q|s.async = true;\n|
          html += %Q|s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto&uid=#{site.flattr_userid}&category=text';\n|
          html += %Q|t.parentNode.insertBefore(s, t);\n|
          html += %Q|})(); /* ]]> */ </script>|
          html
        end
        def flattr_large_counter(param={})
          url = param[:url] ? param[:url] : site.base_url + self.url
          title = param[:title] ? param[:title] : site.title
          category = param[:category] ? param[:category] : "text"
          tags = param[:tags] ? "tags:" + param[:tags] + ";" : ""
          html = %Q|<a class="FlattrButton" style="display:none;" href="#{url}" title="#{title}" |
          html += %Q|rev="flattr;uid:#{site.flattr_userid};category:#{category};#{tags}"></a>|
          # rev="flattr;category:text;tags:tag,tag2,tag3;"
          # html += %Q|<noscript><a href="http://flattr.com/thing/342256/Emmanuel-Bernard-website" target="_blank">|
          # html += %Q|<img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" /></a></noscript>|
          html
        end
        def flattr_compact_counter()
          html = %Q|<a class="FlattrButton" style="display:none;" rev="flattr;button:compact;" href="http://emmanuelbernard.com"></a>|
          html += %Q|<noscript><a href="http://flattr.com/thing/342256/Emmanuel-Bernard-website" target="_blank">|
          html += %Q|<img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" /></a></noscript>|
          html
        end
        def flattr_static()
          html = %Q|<a href="http://flattr.com/thing/342256/Emmanuel-Bernard-website" target="_blank">|
          html += %Q|<img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" /></a>|
          html
        end
      end
    end
  end

end
