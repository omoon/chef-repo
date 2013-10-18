#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
    action :install
end

%w{php php-pear php-mysql php-domxml-php4-php5 php-mbstring php-gd php-pecl-apc php-pecl-yaml php-mcrypt}.each do |name|
  package name do
    action :install
    options("--enablerepo=remi")
  end
end

template "/etc/php.ini" do
    source "php.ini.erb"
    mode 0644
end

directory "/var/log/httpd" do
 mode "0755"
end

service "httpd" do
    action [ :enable, :restart ]
end
