#
# Cookbook:: ubuntu-installation-recipes
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ubuntu-installation-recipes::install-gui' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    # install-gui section
    it 'updates apt repo' do
      expect(chef_run).to update_apt_update('update_repo')
    end

    it 'installs xfce4' do
      expect(chef_run).to install_package('xfce4')
    end

    it 'installs xrdp' do
      expect(chef_run).to install_package('xrdp')
    end
    # /install-gui section

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
