include_recipe %w{}

basename= "mod_wsgi-#{node['mod_wsgi']['version']}"

remote_file "/tmp/#{basename}.tar.gz" do
	source "#{node['mod_wsgi']['base_url']}/#{basename}.tar.gz"
	checksum "#{node['mod_wsgi']['checksum']}"
	notifies :run, "execute[build-mod_wsgi]"
	not_if "test -e #{node['apache']['dir']}/mods-available}/wsgi.load"
end

execute "build-mod_wsgi" do
	command <<END
cd tmp;
tar -xzvf #{basename}.tar.gz;
cd #{basename};
./configure;
make;
make install;
END
	action :nothing
end


