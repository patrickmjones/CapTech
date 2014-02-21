class Stitch < MustacheTag
	@@path = ""
	$stitchdir = 'stitch'
	@@pagedir = 'pages'
	@@outputdir = 'html'
	$appdir = 'app'
	$contentdir = $appdir + '/content'
	def initialize(path)
		@@path = path
		$stitchdir = @@path + '/' + $stitchdir
		@@pagedir = $stitchdir + '/' + @@pagedir
		@@outputdir = $stitchdir + '/' + @@outputdir
		$contentdir = @@path + '/' + $contentdir
		$file = ""
	end
	
	def get_stitch_dir()
		return $stitchdir
	end	
	def  get_page_dir()
		return @@pagedir
	end	
	def get_output_dir()
		return @@outputdir
	end
	
	def stitch_files()
		Dir.foreach(@@pagedir) do |page|
			next if page == '.' or page == '..'	
			
			puts "Page " + page + " found."
			currentfile = read_file(@@pagedir+ '/' + page)
			
			#Parse Mustache Tags
			newcontent = parse_mustache_tag(currentfile)
			
			if !newcontent.empty? 
				#Tidy Markup
				tidymarkup = TidyMarkup.new
				tidycontent = tidymarkup.tidy(newcontent)
				
				#Create Stitched File
				File.open(@@outputdir + "/" + page, 'w') {|f| f.write(tidycontent)}	
				puts "File stitch complete.", ""
			end
		end
	end
end