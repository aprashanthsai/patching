#
# Cookbook Name:: patching
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'patching::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'downloads bash rpm if missing' do
      expect(chef_run).to create_remote_file('/tmp/bash-4.1.2-33.el6.x86_64.rpm')
    end

    it 'installs the bash rpm from saved file' do
      expect(chef_run).to install_package('bash')
    end

    it 'uninstalls the samba package' do
      expect(chef_run).to remove_package('samba')
    end

    it 'uninstalls the samba-common package' do
      expect(chef_run).to remove_package('samba-common')
    end

    it 'installs samba4 from yum repository' do
      expect(chef_run).to install_package('samba4')
    end

    it 'uninstalls the java-1.6.0-openjdk package' do
      expect(chef_run).to remove_package('java-1.6.0-openjdk')
    end

    it 'installs java-1.7.0-openjdk from yum repository' do
      expect(chef_run).to install_package('java-1.7.0-openjdk')
    end

  end
end
