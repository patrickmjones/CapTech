stitchdir = 'stitch'
pagedir = stitchdir + '/pages'
outputdir = stitchdir + '/html'

Dir.foreach(pagedir) do |page|
  next if page == '.' or page == '..'

  newcontents = ""
  currentfile = File.open(pagedir + '/' + page)
  filecontents = currentfile.read
  newcontents = filecontents


  loop do
    matches = filecontents.scan(/\{include\((?<files>.*)\)\}/)   
    print "Found matches: "
    print matches
    print "\n"
    matches.each { |m| 
       includefile = stitchdir + "/" + m[0] + ".html"
       print page + " >> " + includefile + "\n"

       # TODO: Load any file extension
       includefilehandle = File.open(includefile)
       includecontents = includefilehandle.read
     
       # Do replace
       newcontents["{include(" + m[0] + ")}"] = includecontents
    }

    print "loop done\n"
    filecontents = newcontents

    noMatch = matches.empty?
    matches.clear

    break if noMatch
  end
print "file complete\n"
  File.open(outputdir + "/" + page, 'w') {|f| f.write(newcontents)}
end


