				case hookname
					when $HOOK_INCLUDE
						parsedcontent = parse_hook_include(args)
					else
						parsedcontent = ""
						puts "Not #$HOOK_INCLUDE - Hook Name is " + hookname
				end




if defined? "parse_hook_" + hookname
	call parse_hook_$hookname($args)
else
	parsedcontent = ""
	puts "Not #$HOOK_INCLUDE - Hook Name is " + hookname	
end

# Include Stitch Class
require File.dirname(__FILE__) + '/config/base_config.rb'
require File.dirname(__FILE__) + '/app/controllers/Stitch.rb'
stitch = Stitch.new(File.dirname(__FILE__))
include File.dirname(__FILE__) + '/stitch_config.rb'
include File.dirname(__FILE__) + '/stitch_hooks.rb'
stitch.stitch_files()

parse_hooks_sdbutton(*args) 
	myStitch = AACCStitchHooks.new
	return send(myStitch.sdbutton, *args)
end

$JS_DIR = "/scripts/"
$CSS_DIR = "/stylesheets/"

{js(jquery.js, jquery-plugins.js, main.js, otherfile.js)}
{css(jquery-carousel.css, layout.css, somethingelse.css)}

class AACCStitchHooks
	def sdbutton(foo)

	end
	def sdbutton(foo, bar)

	end
end


