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