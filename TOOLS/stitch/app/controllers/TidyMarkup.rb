class TidyMarkup
	def tidy(content)
		#gsub('/^[ \t]+/', "")
		return content.gsub('/[[:space:]]/', "")
	end
end