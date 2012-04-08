#!/usr/bin/env ruby
#
# Generate a htaccess rule for each old blog entry from
# http://blog.emmanuelbernard.com/yyyy/mm/slug to http://emmanuelbernard.com/blog/yyyy/mm/dd/slug
# Has to be manual as the day is unknown in the URL
#
Dir.foreach("../blog") { |file| 
	if (file =~ /(20[0-1][0-9])-([0-1][0-9])-([0-3][0-9])-([^\/]+).html.erb/)
		result = "RewriteRule " << $1 << "/" << $2 << "/" << $4 << "[/]?"
		result = result << " http://emmanuelbernard.com/blog/"
		result = result << $1 << "/" << $2 << "/" << $3 << "/" << $4 << "/ [R=301,L]"
		puts result
	end
}