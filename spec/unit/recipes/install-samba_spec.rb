#
# Cookbook:: ubuntu-installation-recipes
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ubuntu-installation-recipes::install-samba' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    # install-samba section
    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end

    it 'creates the /samba directory with attributes' do
      expect(chef_run).to create_directory('/smbshare').with(
        owner:  'root',
        group:  'root',
        mode:   '0777'
      )
    end

    it 'creates the file smb.conf' do
      expect(chef_run).to create_cookbook_file('/etc/samba/smb.conf')
    end
    # /install-samba

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
