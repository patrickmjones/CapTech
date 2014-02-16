def read_file(file)
	# TODO: Load any file extension
	opened_file = File.open(file)
	return opened_file.read
end