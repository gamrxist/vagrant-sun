#
# Cookbook Name:: sun-db
# Recipe:: default
#
# Copyright 2013, Systems United Navy
#
# All rights reserved - Do Not Redistribute
#

include_recipe "build-essential"

include_recipe "git"
include_recipe "mysql::server"

include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"
include_recipe "logrotate"

include_recipe "php"
include_recipe "php::module_apc"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"

# Initialize sites data bag
sites = []
begin
    sites = data_bag("sites")
rescue
    puts "Unable to load sites data bag."
end

# Configure sites
sites.each do |name|
    site = data_bag_item("sites", name)

    # Add site to apache config
    web_app site["host"] do
        template "sites.conf.erb"
        server_name site["host"]
        server_aliases site["aliases"]
        server_include site["include"]
        docroot site["docroot"]?site["docroot"]:"/vagrant/www/#{site["host"]}"
    end

    # Add site info in /etc/hosts
    bash "hosts" do
        code "echo 127.0.0.1 #{site["host"]} #{site["aliases"].join(' ')} >> /etc/hosts"
    end
end
