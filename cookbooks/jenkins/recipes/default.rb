#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins-ci.org/debian'
  distribution 'binary/'
  key 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
end

package 'jenkins'

