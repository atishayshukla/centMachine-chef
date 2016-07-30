

actions :install
default_action :install

property :source, String
property :version, String, name_property: true

# version_number = node['redis']['version_number']

action :install do
	source_url = source

	remote_file "/tmp/redis-#{version}.tar.gz" do
	  # source "http://download.redis.io/releases/redis-#{version}.tar.gz"
	  # require 'pry' ; binding.pry
	  source source_url
	  notifies :run, "execute[tar xzf redis-#{version}.tar.gz]", :immediately
	end

	# unzip the archive
	execute "tar xzf redis-#{version}.tar.gz" do
	  cwd "/tmp"
	  action :nothing
	  notifies :run, "execute[make && make install]", :immediately
	end

	# Configure the application: make and make install
	execute "make && make install" do
	  cwd "/tmp/redis-#{version}"
	  action :nothing
	  notifies :run, "execute[echo -n | ./install_server.sh]", :immediately
	end

	# Install the Server
	execute "echo -n | ./install_server.sh" do
	  cwd "/tmp/redis-#{version}/utils"
	  action :nothing
	end
end
