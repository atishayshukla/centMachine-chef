#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Translated Instructions From:
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis
#
# Attempt to make resources idempotent

execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end  # This will make it idempotent
end

package "build-essential"

package "tcl8.5"

# version_number = '2.8.9' This works but not the right place move to attribute

version_number = node['redis']['version_number']

# download http://download.redis.io/releases/redis-2.8.9.tar.gz

# LWRP

redis version_number do
  source "http://download.redis.io/releases/redis-#{version_number}.tar.gz"
end

 # Now lets move them to custom resource

service "redis_6379" do
  action [ :start ]
  # This is necessary so that the service will not keep reporting as updated
  supports :status => true
end
