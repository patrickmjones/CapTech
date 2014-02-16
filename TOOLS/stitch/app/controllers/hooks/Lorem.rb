class Lorem
	def initialize(*args)
		if !args.empty?
			if args.length == 1
				lorem_single_tag(args[0])
			elsif args.length == 2
				lorem_multiple_tags(args[0], args[1])
			end
		else
			puts "There are no params in the hook"
		end
	end
	def lorem_single_tag(tag)
		$content = "<" + tag + ">" + "Lorem Ipsum " + tag + " tag </" + tag + ">"
	end
	def lorem_multiple_tags(tag, num)
		n = 1
		while n <= Integer(num)
			$content += "<" + tag + ">" + "Lorem Ipsum " + n.to_s + " " + tag + " tag </" + tag + ">\n"
			n += 1
		end
	end
end