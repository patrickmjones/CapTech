class Stitch
	$HOOK_INCLUDE = "include"
	$HOOK_LOREM = "lorem"
	@@path = ""
	@@stitchdir = 'stitch'
	@@pagedir = 'pages'
	@@outputdir = 'html'
	def initialize(path)
		@@path = path
		@@stitchdir = @@path + '/' + @@stitchdir
		@@pagedir = @@stitchdir + '/' + @@pagedir
		@@outputdir = @@stitchdir + '/' + @@outputdir
	end
	
	def get_stitch_dir()
		return @@stitchdir
	end	
	def  get_page_dir()
		return @@pagedir
	end	
	def get_output_dir()
		return @@outputdir
	end
	
	def get_pages()
		pages = Array.new
		Dir.foreach(get_page_dir()) do |page|
			next if page == '.' or page == '..'			
			puts "Page " + page + " found."
			pages.push(page)
		end
		return pages
	end
	
	def stitch_files()
		Dir.foreach(@@pagedir) do |page|
			next if page == '.' or page == '..'	
			
			puts "Page " + page + " found."
			currentfile = File.open(@@pagedir+ '/' + page)
			
			#Parse Mustache Tags
			newcontent = parse_mustache_tag(currentfile.read)
			
			if !newcontent.empty? 
				#Create Stitched File
				File.open(@@outputdir + "/" + page, 'w') {|f| f.write(newcontent)}				
				puts "File stitch complete."
			end
		end
	end
	
	def parse_mustache_tag(content)
		newcontent = content
		parsedcontent = ""
		loop do
			matches = content.scan(/\{(?<mtemplate>(?<hookname>[^\(]+)\((?<args>[^\)]+)\))\}/)
			matches.each { |m| 
				mtemplate = m[0]
				hookname = m[1]
				args = m[2]
				
				# Switch to Hook Handler
				case hookname
					when $HOOK_INCLUDE
						parsedcontent = parse_hook_include(args)
					else
						parsedcontent = ""
						puts "Not #$HOOK_INCLUDE - Hook Name is " + hookname
				end

				# Do replace
				#if !parsedcontent.empty?
					newcontent["{" + mtemplate + "}"] = parsedcontent
				#end
			}
			
			puts "Loop completed.\n"
			content = newcontent

			noMatch = matches.empty?
			matches.clear
			
			break if noMatch
		end
		return newcontent
	end
	
	def parse_hook_include(args)
		#TODO: Loop through args array
		if args.split(',').count == 1
			filepath = @@stitchdir + '/' + args + '.html'
			puts "Include file is " + filepath
		
			return read_file(filepath)
		end
	end
	
	def parse_hook_lorem(args)
		for arg in args.split(',')
			puts "New Args is " + arg
		end
	end
	
	def read_file(filepath)
		# TODO: Load any file extension
		includefile = File.open(filepath)
		return includefile.read
	end
	
end