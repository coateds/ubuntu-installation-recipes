#
# Cookbook:: ubuntu-installation-recipes
# Recipe:: install-samba
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update
package 'samba'

directory '/smbshare' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

cookbook_file '/etc/samba/smb.conf' do
  source 'smb.conf'
end