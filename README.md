# Notes

Since we are running chef exec rspec a lot, we can use GUARD.

In the ruby it acts as a watcher for the file and then do some actions

Guard is a gem, so to install it what we can do is create a file in the cookbook and say 'Gemfile'

Refer to my Gemfile in redis cookbook which is in chef-practice repo

Then after preparing gemfile do 'chef exec bundle install' to install them on your repo

Then do chef exec guard

Then finally do chef exec guard init -- This will give a Guardfile in the cookbook dir

guard is not working lets skip it

lets create lwrp

chef generate lwrp <Name>

give action in lwrp as :install



guard :rspec, cmd: "chef exec rspec" do
	require "guard/rspec/dsl"
	dsl = Guard::Rspec::Dsl.new(self)

  # Rspec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Recipe files
  watch(%r{^r(recipes)/(.+)\.rb$}) { rspec.spec_dir }




# Overview

Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live. We strongly recommend storing this repository in a version control system such as Git and treat it like source code.

While we prefer Git, and make this repository available via GitHub, you are welcome to download a tar or zip archive and use your favorite version control system to manage the code.

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

# Configuration

The config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Chef Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

<https://docs.chef.io/knife.html>

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.
