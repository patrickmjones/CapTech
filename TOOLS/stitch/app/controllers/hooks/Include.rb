class Include
	def initialize(*args)
		if !args.empty?
			if args.length == 1
				include_file(args[0])
			end
		else
			puts "There are no params in the hook"
		end
	end
	def include_file(filepath)
		$file = $stitchdir + '/' + filepath + '.html'
		puts "Including file: " + $file	
		$content = read_file($file)
	end
end