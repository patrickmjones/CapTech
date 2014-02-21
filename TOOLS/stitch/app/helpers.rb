def open_file(file)
	# TODO: Load any file extension
	return File.open(file)
end
def read_file(file)
	opened_file = open_file(file)
	return opened_file.read
end
def write_to_file(file, content)
	File.open(file, 'w') {|f| f.write(content)}	
end