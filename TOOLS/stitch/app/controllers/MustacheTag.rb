class MustacheTag < Hooks
	
	def parse_mustache_tag(content)
		newcontent = content
		parsedcontent = ""
		loop do
			matches = content.scan(/\{(?<mtemplate>(?<hookname>[^\(]+)\((?<args>[^\)]+)\))\}/)
			matches.each { |m| 
				mtemplate = m[0]
				hookname = m[1]
				args = m[2]
				
				# Hook Handlers
				hook_method = 'parse_hook_' + hookname
				if respond_to?(hook_method) 
					hook = Hooks.new()
					parsedcontent = hook.send(hook_method, *args.split(","))
				else
					parsedcontent = ""
					puts "Hook Method: " + hook_method + " is not found"
				end

				# Do replace
				newcontent["{" + mtemplate + "}"] = parsedcontent
			}
			
			puts "Loop completed.", ""
			content = newcontent

			noMatch = matches.empty?
			matches.clear
			
			break if noMatch
		end
		return newcontent
	end
	
end