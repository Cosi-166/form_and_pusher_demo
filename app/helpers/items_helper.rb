module ItemsHelper

	def field_h(name, key, f)
		("<p>" + name + ": " + f.text_field(key) + "</p>").html_safe
	end

end
