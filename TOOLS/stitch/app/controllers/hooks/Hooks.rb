class Hooks
	$content = ""
	def initialize
		$content.clear
	end
	def parse_hook_include(*args)
		Include.new(*args)
		
		newcontent = $content	
		matches = newcontent.scan(/\{(?<mtemplate>(?<hookname>[^\(]+)\((?<args>[^\)]+)\)(?<bool>[^\(]+))\}/)
		
		matches.each { |m| 
			mtemplate = m[0]
			hookname = m[1]
			args = m[2]
			bool = m[3]
			
			# Check if user wants to Stitch Permanently
			# The Stitched content will replace the Mustache Tags
			if !bool.nil? && !bool.empty?
				params = *bool.split(",")
				puts "params is " + params[1].to_s
				if params[1].to_s.match(/(1|true|t|yes|y)$/i)
					$stitch_permanent = true
					puts "Stitch permanently is " + $stitch_permanent.to_s
					puts "File is " + $file
					
					Lorem.new(*args.split(","))
					puts "Content is " + $content
					
					# Do replace
					newcontent["{" + mtemplate + "}"] = $content
					write_to_file($file, newcontent);
					
					$content = newcontent
				end
			end			
		}
		
		return $content
	end
	
	def parse_hook_lorem(*args)
		Lorem.new(*args)
		return $content
	end
end