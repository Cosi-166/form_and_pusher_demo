module ItemsHelper

	def field_h(name, key, f)
		name.html_safe + f.text_field(key)
	end


end
