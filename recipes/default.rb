if node['mod_wsgi']['install_method'] == 'source' 
	include_recipe "mod_wsgi::source"
else
	include_recipe "mod_wsgi::package"
end
