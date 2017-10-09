#
# Cookbook:: ubuntu-installation-recipes
# Recipe:: server-info-web
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# case node['platform_family']
# when 'redhat'
#   package 'httpd'
# when 'debian'
#   package 'apache2'
# end
package 'apache2'

file '/var/www/html/index.html' do
  content '<h1>My home page</h1>
<a href="server-info.html">Link to server-info</a>'
end

# This will create a file with Ohai/Fauxhai attributes expanded
template '/var/www/html/server-info.html' do
  source 'server-info.html.erb'
end