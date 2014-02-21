class Lorem
	def initialize(*args)
		@loremfile = $contentdir + '/lorem.txt'
		@pointer = 0
		@wordcount = 20
		if !args.empty?
			if args.length == 1
				if(args[0].to_s == 'text')
					lorem_text()
				else 
					lorem_single_tag(args[0])
				end
			elsif args.length == 2
				lorem_multiple_tags(args[0], args[1])
			end
		else
			puts "There are no params in the hook"
		end
	end
	
	def lorem_text()
		$content = get_content(nil)
		puts "displaying lorem "
	end
	
	def lorem_single_tag(tag)
		$content = get_content_with_tag(tag, nil)
	end
	def lorem_multiple_tags(tag, num)
		$content = get_multiple_content(tag, nil, num)
	end
	def lorem_multiple_tags_with_length(tag, num)
		$content = get_multiple_content(tag, nil, num)
	end
	
	def create_tag(tag, content)
		content = content.gsub(/^(\W*?[a-z])/).each { |m| m.upcase }
		return "<" + tag + ">" + content + "</" + tag + ">"
	end
	
	def get_content(wordcount)
		unless wordcount.nil?
			@wordcount = wordcount
		end
		return get_content_from_file()
	end
	def get_content_with_tag(tag, wordcount)
		lorem = get_content(wordcount)
		return create_tag(tag, lorem)
	end
	
	def get_multiple_content(tag, wordcount, num)
		multiple_content = ""
		if Integer(num) > 0
			n = 1
			while n <= Integer(num)
				multiple_content += get_content_with_tag(tag, wordcount)
				if n != Integer(num)
					multiple_content += "\n"
				end
				n += 1
			end
		elsif
			multiple_content = get_content_with_tag(tag, wordcount)
		end
		return multiple_content
	end
	
	def get_content_from_file()
		loremcontent = ""
		opened_file = open_file(@loremfile)
		
		# Set pointer to where the last content was copied from Lorem.txt
		if(@pointer > 0)
			opened_file.seek(@pointer, IO::SEEK_SET)
		end
		
		opened_file = opened_file.read		
		matches = opened_file.scan(/\S+/)
		n = 0
		matches.each { |m|
			if n < @wordcount
				# Remove comma from the last word if it exist
				if n == @wordcount - 1
					if m.end_with?(",")
						m = m.sub(",", " ")
					end
				end				
				loremcontent += " " + m
				n += 1
			end
			
			break if n == @wordcount
		}
		
		#TODO: Check if EOF
		
		@pointer += loremcontent.to_s.length
		return loremcontent.strip
	end
end