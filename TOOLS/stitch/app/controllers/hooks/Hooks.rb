class Hooks
	$content = ""
	def initialize
		$content.clear
	end
	def parse_hook_include(*args)
		Include.new(*args)
		return $content
	end
	
	def parse_hook_lorem(*args)
		Lorem.new(*args)
		return $content
	end
end