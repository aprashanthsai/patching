#
# Cookbook Name:: patching
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_handler "MailHandler" do
  source '/var/chef/handlers/mail/mail'
  arguments :to_address => "prashanth.sai.athicarla@hpe.com"
  action :nothing
end.run_action(:enable)

remote_file '/tmp/bash-4.1.2-33.el6.x86_64.rpm' do
  source 'http://192.168.1.100:8081/nexus/content/repositories/local-artifacts/bash-4.1.2-33.el6.x86_64.rpm'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

package 'bash' do
  action :install
  source '/tmp/bash-4.1.2-33.el6.x86_64.rpm'
end

package 'samba' do
  action :remove
end

package 'samba-common' do
  action :remove
end

package 'samba4' do
  action :install
end

package 'java-1.6.0-openjdk' do
  action :remove
end

package 'java-1.7.0-openjdk' do
  action :install
end
