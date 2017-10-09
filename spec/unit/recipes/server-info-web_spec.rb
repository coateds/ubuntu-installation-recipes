#
# Cookbook:: ubuntu-installation-recipes
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Using the server-info-web recipe,
# 1) Install a web server (apache2)
# 2) Create a default file/web page with content (a link to the server info page)
# 3) Create a server info page from a template with Ohai/Fauxhai automatic attributes

require 'spec_helper'

describe 'ubuntu-installation-recipes::server-info-web' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    # server-info section
    # 1) Install a web server (apache2)
    # case "#{node['platform_family']}"
    #   when 'redhat'
    #     package 'httpd'
    #   when 'debian'
    #     package 'apache2'
    # end
    it 'installs apache2' do
      expect(chef_run).to install_package('apache2')
    end

    it 'creates the index.html file with attributes' do
      expect(chef_run).to create_file('/var/www/html/index.html').with(
        content:  '<h1>My home page</h1>
<a href="server-info.html">Link to server-info</a>'
      )
    end

    it 'creates a template for server-info.html' do
      expect(chef_run).to create_template('/var/www/html/server-info.html')
    end
    # /server-info section

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
