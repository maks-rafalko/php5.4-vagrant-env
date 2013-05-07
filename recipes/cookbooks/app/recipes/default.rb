#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "mysql::ruby"


# create new database
mysql_database node['app']['database'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

# create folder for your application
directory node["app"]["path"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# create VirtualHost
web_app 'app' do
  template 'vhost.erb'
  docroot node['app']['path']
  server_name node['app']['server_name']
  server_email node['app']['server_email']
end

case node[:platform]
	when "ubuntu", "debian"
		execute "install-python-software-properties" do
		command "apt-get install -y python-software-properties"
		action :run
	end
	
	# setup a command to add new ppa
	execute "add-apt-repository" do
		command "sudo add-apt-repository ppa:ondrej/php5 && sudo apt-get update"
		action :run
	end
end 

package "php5-mysql" do
	action :install
end

package "git" do
    action :install
end

package "mercurial" do
    action :install
end